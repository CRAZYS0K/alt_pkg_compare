# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.23.2)

# We name the project and the target for the ExternalProject_Add() call
# to something that will highlight to the user what we are working on if
# something goes wrong and an error message is produced.

project(jsoncpp-populate NONE)



include(ExternalProject)
ExternalProject_Add(jsoncpp-populate
                     "UPDATE_DISCONNECTED" "False" "URL" "https://github.com/open-source-parsers/jsoncpp/archive/refs/tags/1.9.5.tar.gz"
                    SOURCE_DIR          "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src"
                    BINARY_DIR          "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-build"
                    CONFIGURE_COMMAND   ""
                    BUILD_COMMAND       ""
                    INSTALL_COMMAND     ""
                    TEST_COMMAND        ""
                    USES_TERMINAL_DOWNLOAD  YES
                    USES_TERMINAL_UPDATE    YES
                    USES_TERMINAL_PATCH     YES
)


