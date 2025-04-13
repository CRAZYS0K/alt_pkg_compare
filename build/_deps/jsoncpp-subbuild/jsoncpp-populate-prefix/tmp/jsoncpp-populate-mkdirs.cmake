# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src"
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-build"
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-subbuild/jsoncpp-populate-prefix"
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-subbuild/jsoncpp-populate-prefix/tmp"
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-subbuild/jsoncpp-populate-prefix/src/jsoncpp-populate-stamp"
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-subbuild/jsoncpp-populate-prefix/src"
  "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-subbuild/jsoncpp-populate-prefix/src/jsoncpp-populate-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-subbuild/jsoncpp-populate-prefix/src/jsoncpp-populate-stamp/${subDir}")
endforeach()
