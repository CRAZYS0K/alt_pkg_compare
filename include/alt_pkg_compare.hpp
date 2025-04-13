#pragma once
#ifndef alt_pkg_compare_h
#define alt_pkg_compare_h
#include <vector>
#include <string>
#include <map>
#include <iostream>
#include <cctype>
#include <json/json.h>
#include <curl/curl.h>
#include <algorithm>
#include <regex>
#include <set>
#include <cstdlib>
#include <fstream>
#include <iomanip>
#include <chrono>
#include <thread>

struct Package{
    std::string name;
    std::string version;
    std::string release;
    std::string arch;

    std::string full_version() const;
};
struct Stats{
    int64_t p10_only;
    int64_t sisyphus_only;
    int64_t newer_in_sisyphus;
    };
    
class PackageComparator {
    private:
    Stats last_stats;
    public:
    Stats get_last_stats() const { return last_stats; }
    PackageComparator();
    void print_json_to_console_with_stats_at_end(
    const Json::Value& json, const Stats& stats) const;
    Json::Value compare_branches(const std::string& branch1, const std::string& branch2);
    std::vector<Package> fetch_branch_packages(const std::string& branch);
    Json::Value compare_packages(const std::vector<Package> &p10, const std::vector<Package> &sisyphus);
    Json::Value compare_packages_with_file_output(const std::vector<Package>& branch1_pkgs,  const std::vector<Package>& branch2_pkgs, const std::string& output_filename);
    int compare_rmp_versions(const std::string& v1, const std::string& v2);
    void print_json_to_console(const Json::Value& json) const {
        Json::StreamWriterBuilder writer;
        writer["indentation"] = "  ";
        std::unique_ptr<Json::StreamWriter> writer_ptr(writer.newStreamWriter());
        writer_ptr->write(json, &std::cerr);
        std::cerr << std::flush; // Принудительный сброс буфера
    }
    void write_json_with_stats(const Json::Value& json, const Stats& stats,const std::string& filename) const; 
    void print_stats(const Stats& stats) const;
    void print_results_properly(const Json::Value& json, const Stats& stats) {
    // 1. Выводим JSON
    Json::StreamWriterBuilder writer;
    writer["indentation"] = "  ";
    std::unique_ptr<Json::StreamWriter> writer_ptr(writer.newStreamWriter());
    writer_ptr->write(json, &std::cerr);
    
    // 2. Принудительно сбрасываем буфер
    std::cerr << std::flush;
    
    // 3. Выводим статистику
    std::cerr << "\n=== SUMMARY STATISTICS ===\n"
              << "Packages only in p10: " << stats.p10_only << "\n"
              << "Packages only in sisyphus: " << stats.sisyphus_only << "\n"
              << "Packages newer in sisyphus: " << stats.newer_in_sisyphus << "\n"
              << "==========================\n"
              << std::flush; // Снова сбрасываем буфер
}
};

#endif //alt_pkg_compare_h