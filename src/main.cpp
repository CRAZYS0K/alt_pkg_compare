#include "alt_pkg_compare.hpp"
#include <iostream>
#include <cstdlib>

int main(int argc, char* argv[]) {
    std::cout << "Программа запущена... это может занять время..." << std::endl;
    if (argc != 1) {
        std::cerr << "Usage: " << argv[0] << std::endl;
        return EXIT_FAILURE;
    }
    
    try {
        PackageComparator comparer;
        
        auto p10_pkgs = comparer.fetch_branch_packages("p10");
        auto sisyphus_pkgs = comparer.fetch_branch_packages("sisyphus");
        
        Json::Value result = comparer.compare_packages_with_file_output(
            p10_pkgs, 
            sisyphus_pkgs,
            "alt_pkg_compare/filename.json"
        );
        
        // Выводим JSON
        Json::StreamWriterBuilder writer;
        writer["indentation"] = "  ";
        std::string output = Json::writeString(writer, result);
        std::cout << output << std::endl;

        // Извлекаем статистику из JSON
        if (result.isMember("statistics")) {
            const Json::Value& statsJson = result["statistics"];
            
            // Выводим статистику в консоль
            std::cerr << "\n=== ИТОГОВАЯ СТАТИСТИКА ===" << std::endl;
            std::cerr << "Пакетов только в p10:        " 
                     << statsJson["total_packages_only_in_p10"].asInt() << std::endl;
            std::cerr << "Пакетов только в Sisyphus:   " 
                     << statsJson["total_packages_only_in_sisyphus"].asInt() << std::endl;
            std::cerr << "Пакетов новее в Sisyphus:   " 
                     << statsJson["total_packages_newer_in_sisyphus"].asInt() << std::endl;
            std::cerr << "============================" << std::endl;
        } else {
            std::cerr << "Предупреждение: Статистика не найдена в JSON" << std::endl;
        }
        
        return EXIT_SUCCESS;
    } catch (const std::exception& e) {
        std::cerr << "\nОшибка: " << e.what() << std::endl;
        return EXIT_FAILURE;
    }
}