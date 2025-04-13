# CMake generated Testfile for 
# Source directory: /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner
# Build directory: /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/jsontestrunner
# 
# This file includes the relevant testing commands required for 
# testing this directory and lists subdirectories to be tested as well.
add_test(jsoncpp_readerwriter "/usr/bin/python3.9" "-B" "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/../../test/runjsontests.py" "/home/sok/alt_pkg_compare/build/bin/jsontestrunner_exe" "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/../../test/data")
set_tests_properties(jsoncpp_readerwriter PROPERTIES  WORKING_DIRECTORY "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/../../test/data" _BACKTRACE_TRIPLES "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/CMakeLists.txt;43;add_test;/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/CMakeLists.txt;0;")
add_test(jsoncpp_readerwriter_json_checker "/usr/bin/python3.9" "-B" "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/../../test/runjsontests.py" "--with-json-checker" "/home/sok/alt_pkg_compare/build/bin/jsontestrunner_exe" "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/../../test/data")
set_tests_properties(jsoncpp_readerwriter_json_checker PROPERTIES  WORKING_DIRECTORY "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/../../test/data" _BACKTRACE_TRIPLES "/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/CMakeLists.txt;47;add_test;/home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/jsontestrunner/CMakeLists.txt;0;")
