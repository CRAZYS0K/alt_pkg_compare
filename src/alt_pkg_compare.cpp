#include "alt_pkg_compare.hpp"


void PackageComparator::print_stats(const Stats& stats) const {
        std::cerr << "\n=== SUMMARY STATISTICS ===\n";
        std::cerr << "Packages only in p10: " << stats.p10_only << "\n";
        std::cerr << "Packages only in sisyphus: " << stats.sisyphus_only << "\n";
        std::cerr << "Packages newer in sisyphus: " << stats.newer_in_sisyphus << "\n";
        std::cerr << "==========================\n" << std::flush;
}

void PackageComparator::write_json_with_stats(const Json::Value& json, 
                                           const Stats& stats,
                                           const std::string& filename) const 
{
    // 1. Открываем файл для записи
    std::ofstream out_file(filename);
    if (!out_file.is_open()) {
        throw std::runtime_error("Failed to open file: " + filename);
    }

    // 2. Создаем копию JSON, чтобы добавить статистику
    Json::Value output_json = json;
    
    // 3. Добавляем статистику в JSON
    Json::Value stats_json;
    stats_json["total_packages_only_in_p10"] = stats.p10_only;
    stats_json["total_packages_only_in_sisyphus"] = stats.sisyphus_only;
    stats_json["total_packages_newer_in_sisyphus"] = stats.newer_in_sisyphus;
    output_json["statistics"] = stats_json;

    // 4. Настраиваем форматирование JSON
    Json::StreamWriterBuilder writer_builder;
    writer_builder["indentation"] = "  ";  // Отступ в 2 пробела
    writer_builder["commentStyle"] = "None";
    writer_builder["enableYAMLCompatibility"] = false;
    writer_builder["dropNullPlaceholders"] = false;
    writer_builder["useSpecialFloats"] = false;

    // 5. Записываем JSON в файл
    try {
        std::unique_ptr<Json::StreamWriter> writer(writer_builder.newStreamWriter());
        writer->write(output_json, &out_file);
        out_file << std::endl;  // Добавляем перенос строки в конце файла
    } catch (const std::exception& e) {
        out_file.close();
        throw std::runtime_error("JSON writing failed: " + std::string(e.what()));
    }

    // 6. Закрываем файл
    out_file.close();

    // 7. Дополнительно выводим статистику в консоль
    std::cerr << "\nStatistics written to file:\n"
              << "  Packages only in p10:        " << stats.p10_only << "\n"
              << "  Packages only in sisyphus:   " << stats.sisyphus_only << "\n"
              << "  Packages newer in sisyphus:  " << stats.newer_in_sisyphus << "\n"
              << "File successfully saved to: " << filename << std::endl;
}

std::string Package::full_version() const {
    return version + "-" + release;
}
PackageComparator::PackageComparator()
{};

int PackageComparator::compare_rmp_versions(const std::string& v1, const std::string& v2) {
    std::regex version_re("(\\d+)|([a-zA-Z]+)|(~)");
    
    auto it1 = std::sregex_iterator(v1.begin(), v1.end(), version_re);
    auto it2 = std::sregex_iterator(v2.begin(), v2.end(), version_re);
    
    while (it1 != std::sregex_iterator() && it2 != std::sregex_iterator()) {
        std::smatch m1 = *it1;
        std::smatch m2 = *it2;
        
        // Compare numeric parts
        if (m1[1].matched && m2[1].matched) {
            int num1 = std::stoi(m1.str());
            int num2 = std::stoi(m2.str());
            if (num1 != num2) return num1 - num2;
        }
        // Compare string parts
        else if (m1[2].matched && m2[2].matched) {
            int cmp = m1.str().compare(m2.str());
            if (cmp != 0) return cmp;
        }
        // Handle tilde (which sorts before everything)
        else if (m1[3].matched || m2[3].matched) {
            if (m1[3].matched && !m2[3].matched) return -1;
            if (!m1[3].matched && m2[3].matched) return 1;
        }
        
        ++it1;
        ++it2;
    }
    
    // If we get here, the versions are equal or one is a prefix of the other
    return (v1.length() - v2.length());
}

static size_t WriteCallback(void* contents, size_t size, size_t nmemb, std::string* s) {
    size_t newLength = size * nmemb;
    try {
        s->append((char*)contents, newLength);
    } catch(std::bad_alloc &e) {
        return 0;
    }
    return newLength;
}

std::vector<Package> PackageComparator::fetch_branch_packages(const std::string& branch) {
    
    
    
    
    std::vector<Package> packages;
    CURL* curl = curl_easy_init();
    std::string url = "https://rdb.altlinux.org/api/export/branch_binary_packages/" + branch;
    std::string response;
    
    if (curl) {
        curl_easy_setopt(curl, CURLOPT_URL, url.c_str());
        curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, WriteCallback);
        curl_easy_setopt(curl, CURLOPT_WRITEDATA, &response);
        curl_easy_setopt(curl, CURLOPT_USERAGENT, "altlinux-pkg-compare/1.0");
        
        CURLcode res = curl_easy_perform(curl);
        if (res != CURLE_OK) {
            curl_easy_cleanup(curl);
            throw std::runtime_error("Failed to fetch data from API");
        }
        
        curl_easy_cleanup(curl);
    }
    
    
    Json::Value root;
    Json::CharReaderBuilder builder;
    std::string errors;
    std::istringstream response_stream(response);
    
    if (!Json::parseFromStream(builder, response_stream, &root, &errors)) {
        throw std::runtime_error("Failed to parse JSON: " + errors);
    }
    
    // Extract package information
    for (const auto& pkg : root["packages"]) {
        Package info;
        info.name = pkg["name"].asString();
        info.version = pkg["version"].asString();
        info.release = pkg["release"].asString();
        info.arch = pkg["arch"].asString();
        packages.push_back(info);
    }
    
    return packages;
}

namespace {

// Вспомогательные функции для сравнения версий
std::vector<std::string> split_version(const std::string& version) {
    std::vector<std::string> components;
    std::string current;
    
    for (char c : version) {
        if (c == '.' || c == '-' || c == '_' || c == ':') {
            if (!current.empty()) {
                components.push_back(current);
                current.clear();
            }
        } else {
            current += c;
        }
    }
    
    if (!current.empty()) {
        components.push_back(current);
    }
    
    return components;
}

int compare_components(const std::string& a, const std::string& b) {
    // Сначала пытаемся сравнить как числа
    bool a_is_num = std::all_of(a.begin(), a.end(), ::isdigit);
    bool b_is_num = std::all_of(b.begin(), b.end(), ::isdigit);
    
    if (a_is_num && b_is_num) {
        return std::stoi(a) - std::stoi(b);
    }
    
    // Если один числовой, а другой нет - числовой считается старше
    if (a_is_num) return 1;
    if (b_is_num) return -1;
    
    // Иначе сравниваем как строки
    return a.compare(b);
}

int compare_rpm_versions(const std::string& v1, const std::string& v2) {
    if (v1 == v2) return 0;
    
    auto parts1 = split_version(v1);
    auto parts2 = split_version(v2);
    
    size_t max_len = std::max(parts1.size(), parts2.size());
    
    for (size_t i = 0; i < max_len; ++i) {
        std::string part1 = (i < parts1.size()) ? parts1[i] : "0";
        std::string part2 = (i < parts2.size()) ? parts2[i] : "0";
        
        int cmp = compare_components(part1, part2);
        if (cmp != 0) {
            return cmp;
        }
    }
    
    return 0;
}

}



Json::Value PackageComparator::compare_packages(const std::vector<Package>& branch1_pkgs, 
                                              const std::vector<Package>& branch2_pkgs) 
{
    
    Json::Value result;

    try {
        // 1. Группировка пакетов по архитектурам
        auto group_by_arch = [](const std::vector<Package>& pkgs) {
            std::map<std::string, std::vector<Package>> grouped;
            for (const auto& pkg : pkgs) {
                if (!pkg.arch.empty()) {
                    grouped[pkg.arch].push_back(pkg);
                }
            }
            return grouped;
        };
        
        auto branch1_by_arch = group_by_arch(branch1_pkgs);
        auto branch2_by_arch = group_by_arch(branch2_pkgs);
        
        // 2. Сравнение для каждой архитектуры
        for (const auto& [arch, branch1_pkgs] : branch1_by_arch) {
            auto branch2_it = branch2_by_arch.find(arch);
            if (branch2_it == branch2_by_arch.end()) continue;
            
            const auto& branch2_pkgs = branch2_it->second;
            Json::Value arch_result;
            
            // 3. Собираем имена пакетов
            auto get_package_names = [](const std::vector<Package>& pkgs) {
                std::set<std::string> names;
                for (const auto& pkg : pkgs) {
                    if (!pkg.name.empty()) {
                        names.insert(pkg.name);
                    }
                }
                return names;
            };
            
            auto branch1_names = get_package_names(branch1_pkgs);
            auto branch2_names = get_package_names(branch2_pkgs);
            
            // 4. Находим уникальные пакеты
            std::vector<std::string> unique_to_branch1, unique_to_branch2;
            std::set_difference(branch1_names.begin(), branch1_names.end(),
                              branch2_names.begin(), branch2_names.end(),
                              std::back_inserter(unique_to_branch1));
            
            std::set_difference(branch2_names.begin(), branch2_names.end(),
                              branch1_names.begin(), branch1_names.end(),
                              std::back_inserter(unique_to_branch2));
            
            
            for (const auto& name : unique_to_branch1) {
                arch_result["unique_to_branch1"].append(name);
            }
            
            for (const auto& name : unique_to_branch2) {
                arch_result["unique_to_branch2"].append(name);
            }
            
            // 6. Сравниваем версии пакетов
            auto get_versions_map = [](const std::vector<Package>& pkgs) {
                std::map<std::string, std::string> versions;
                for (const auto& pkg : pkgs) {
                    try {
                        versions[pkg.name] = pkg.full_version();
                    } catch (const std::exception& e) {
                        std::cerr << "Error getting version for " << pkg.name 
                                  << ": " << e.what() << std::endl;
                    }
                }
                return versions;
            };
            
            auto branch1_versions = get_versions_map(branch1_pkgs);
            auto branch2_versions = get_versions_map(branch2_pkgs);
            
            Json::Value version_diffs;
            for (const auto& [name, ver1] : branch1_versions) {
                auto ver2_it = branch2_versions.find(name);
                if (ver2_it != branch2_versions.end()) {
                    const auto& ver2 = ver2_it->second;
                    try {
                        int cmp = compare_rpm_versions(ver1, ver2);
                        if (cmp > 0) {
                            Json::Value diff;
                            diff["package"] = name;
                            diff["branch1_version"] = ver1;
                            diff["branch2_version"] = ver2;
                            version_diffs.append(diff);
                        } else if (cmp < 0) {
                            // Для симметрии можно добавить и обратный случай
                            Json::Value diff;
                            diff["package"] = name;
                            diff["branch1_version"] = ver1;
                            diff["branch2_version"] = ver2;
                            version_diffs.append(diff);
                        }
                    } catch (const std::exception& e) {
                        std::cerr << "Version comparison skipped for " << name 
                                  << " (" << ver1 << " vs " << ver2 << "): " 
                                  << e.what() << std::endl;
                    }
                }
            }
            
        
        
            if (!version_diffs.empty()) {
                arch_result["version_differences"] = version_diffs;
            }
            
            result[arch] = arch_result;
        }
        
    } catch (const std::exception& e) {
        std::cerr << "Error in compare_packages: " << e.what() << std::endl;
        throw;
    }
    
    return result;
}
// with file output
Json::Value PackageComparator::compare_packages_with_file_output(
    const std::vector<Package>& branch1_pkgs,
    const std::vector<Package>& branch2_pkgs,
    const std::string& output_filename)
{
    Json::Value result;
    Stats stats = {0, 0, 0}; // Инициализируем нулями
    std::map<std::string, Json::Value> arch_results;

    // Логгирование входных данных
    std::cerr << "Starting comparison:\n"
              << "  p10 packages: " << branch1_pkgs.size() << "\n"
              << "  sisyphus packages: " << branch2_pkgs.size() << std::endl;

    try {
        // 1. Группировка пакетов по архитектурам
        auto group_by_arch = [](const std::vector<Package>& packages) {
            std::map<std::string, std::vector<Package>> grouped;
            for (const auto& pkg : packages) {
                if (!pkg.arch.empty()) {
                    grouped[pkg.arch].push_back(pkg);
                }
            }
            return grouped;
        };

        auto p10_by_arch = group_by_arch(branch1_pkgs);
        auto sisyphus_by_arch = group_by_arch(branch2_pkgs);

        std::set<std::string> all_p10_unique;
        std::set<std::string> all_sis_unique;
        std::set<std::string> all_newer_in_sisyphus;

        // 2. Обработка архитектур, присутствующих в p10
        for (const auto& [arch, p10_arch_pkgs] : p10_by_arch) {
            Json::Value arch_result;
            auto sis_it = sisyphus_by_arch.find(arch);
            
            if (sis_it == sisyphus_by_arch.end()) {
                // Архитектура есть только в p10
                std::set<std::string> unique_names;
                for (const auto& pkg : p10_arch_pkgs) {
                    unique_names.insert(pkg.name);
                }
                for (const auto& name : unique_names) {
                    arch_result["unique_to_p10"].append(name);
                }
                all_p10_unique.insert(unique_names.begin(), unique_names.end());
                arch_results[arch] = arch_result;
                continue;
            }

            // Архитектура есть в обеих ветках
            const auto& sis_arch_pkgs = sis_it->second;

            // 3. Собираем имена пакетов с проверкой дубликатов
            auto extract_names = [](const std::vector<Package>& pkgs) {
                std::set<std::string> names;
                std::set<std::string> duplicates;
                for (const auto& pkg : pkgs) {
                    if (!pkg.name.empty()) {
                        if (!names.insert(pkg.name).second) {
                            duplicates.insert(pkg.name);
                        }
                    }
                }
                if (!duplicates.empty()) {
                    std::cerr << "Warning: Found " << duplicates.size() 
                              << " duplicate packages in arch " << pkgs[0].arch << std::endl;
                }
                return names;
            };

            auto p10_names = extract_names(p10_arch_pkgs);
            auto sis_names = extract_names(sis_arch_pkgs);

            // 4. Находим уникальные пакеты
            std::vector<std::string> p10_only, sis_only;
            std::set_difference(p10_names.begin(), p10_names.end(),
                              sis_names.begin(), sis_names.end(),
                              std::back_inserter(p10_only));
            std::set_difference(sis_names.begin(), sis_names.end(),
                              p10_names.begin(), p10_names.end(),
                              std::back_inserter(sis_only));

            // 5. Сохраняем уникальные пакеты
            std::set<std::string> p10_unique(p10_only.begin(), p10_only.end());
            std::set<std::string> sis_unique(sis_only.begin(), sis_only.end());
            
            for (const auto& name : p10_unique) {
                arch_result["unique_to_p10"].append(name);
            }
            for (const auto& name : sis_unique) {
                arch_result["unique_to_sisyphus"].append(name);
            }

            // 6. Сравниваем версии общих пакетов
            auto build_version_map = [](const std::vector<Package>& pkgs) {
                std::map<std::string, std::string> versions;
                for (const auto& pkg : pkgs) {
                    versions[pkg.name] = pkg.full_version();
                }
                return versions;
            };

            auto p10_versions = build_version_map(p10_arch_pkgs);
            auto sis_versions = build_version_map(sis_arch_pkgs);

            Json::Value version_diffs;
            for (const auto& [name, p10_ver] : p10_versions) {
                if (sis_versions.count(name)) {
                    const auto& sis_ver = sis_versions[name];
                    try {
                        int cmp = compare_rpm_versions(p10_ver, sis_ver);
                        if (cmp < 0) {
                            Json::Value diff;
                            diff["package"] = name;
                            diff["p10_version"] = p10_ver;
                            diff["sisyphus_version"] = sis_ver;
                            version_diffs.append(diff);
                            all_newer_in_sisyphus.insert(name);
                        }
                    } catch (const std::exception& e) {
                        std::cerr << "Version comparison failed for " << name 
                                  << ": " << e.what() << std::endl;
                    }
                }
            }

            if (!version_diffs.empty()) {
                arch_result["newer_in_sisyphus"] = version_diffs;
            }

            all_p10_unique.insert(p10_unique.begin(), p10_unique.end());
            all_sis_unique.insert(sis_unique.begin(), sis_unique.end());
            arch_results[arch] = arch_result;
        }

        // 7. Обрабатываем архитектуры, которые есть только в Sisyphus
        for (const auto& [arch, sis_arch_pkgs] : sisyphus_by_arch) {
            if (p10_by_arch.count(arch) == 0) {
                Json::Value arch_result;
                std::set<std::string> unique_names;
                for (const auto& pkg : sis_arch_pkgs) {
                    unique_names.insert(pkg.name);
                }
                for (const auto& name : unique_names) {
                    arch_result["unique_to_sisyphus"].append(name);
                }
                all_sis_unique.insert(unique_names.begin(), unique_names.end());
                arch_results[arch] = arch_result;
            }
        }

        // 8. Обновляем итоговую статистику
        stats.p10_only = all_p10_unique.size();
        stats.sisyphus_only = all_sis_unique.size();
        stats.newer_in_sisyphus = all_newer_in_sisyphus.size();

        // 9. Добавляем все архитектуры в результат
        for (const auto& [arch, arch_data] : arch_results) {
            result[arch] = arch_data;
        }

        // 10. Добавляем статистику в JSON
        Json::Value stats_json;
        stats_json["total_packages_only_in_p10"] = static_cast<Json::Int64>(stats.p10_only);
        stats_json["total_packages_only_in_sisyphus"] = static_cast<Json::Int64>(stats.sisyphus_only);
        stats_json["total_packages_newer_in_sisyphus"] = static_cast<Json::Int64>(stats.newer_in_sisyphus);
        result["statistics"] = stats_json;

        // 11. Логгирование итоговой статистики
        std::cerr << "\nComparison statistics:\n"
                  << "  Unique to p10:        " << stats.p10_only << "\n"
                  << "  Unique to sisyphus:   " << stats.sisyphus_only << "\n"
                  << "  Newer in sisyphus:    " << stats.newer_in_sisyphus << "\n"
                  << "  Total architectures:  " << arch_results.size() << std::endl;

        // 12. Обработка вывода
        if (!output_filename.empty()) {
            try {
                write_json_with_stats(result, stats, output_filename);
                std::cerr << "Results saved to: " << output_filename << std::endl;
            } catch (const std::exception& file_error) {
                std::cerr << "Warning: File save failed (" << file_error.what() 
                          << "), printing to console instead..." << std::endl;
                print_results_properly(result, stats);
            }
        } else {
            print_results_properly(result, stats);
        }

    } catch (const std::exception& e) {
        std::cerr << "[ERROR] Comparison failed: " << e.what() << std::endl;
        print_results_properly(result, stats);
        throw;
    }
    
    return result;
}
