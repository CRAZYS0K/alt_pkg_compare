cmake_minimum_required(VERSION 3.14)
project(altlinux_pkg_compare)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Загрузка зависимостей
include(FetchContent)
FetchContent_Declare(
    jsoncpp
    URL https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/1.9.5.tar.gz
)
FetchContent_MakeAvailable(jsoncpp)

find_package(CURL REQUIRED)

# Добавляем пути к заголовочным файлам
include_directories(
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/src
)

# Создание исполняемого файла
add_executable(altlinux-pkg-compare 
    src/main.cpp
    src/alt_pkg_compare.cpp
)


# Линковка библиотек
target_link_libraries(altlinux-pkg-compare
    PRIVATE
    CURL::libcurl
    jsoncpp_lib
)