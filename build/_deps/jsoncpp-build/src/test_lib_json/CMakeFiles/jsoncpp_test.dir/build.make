# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.23

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:

#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:

# Disable VCS-based implicit rules.
% : %,v

# Disable VCS-based implicit rules.
% : RCS/%

# Disable VCS-based implicit rules.
% : RCS/%,v

# Disable VCS-based implicit rules.
% : SCCS/s.%

# Disable VCS-based implicit rules.
% : s.%

.SUFFIXES: .hpux_make_needs_suffix_list

# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:
.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/sok/alt_pkg_compare

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/sok/alt_pkg_compare/build

# Include any dependencies generated for this target.
include _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/flags.make

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/flags.make
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o: _deps/jsoncpp-src/src/test_lib_json/jsontest.cpp
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o -MF CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o.d -o CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o -c /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/jsontest.cpp

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jsoncpp_test.dir/jsontest.cpp.i"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/jsontest.cpp > CMakeFiles/jsoncpp_test.dir/jsontest.cpp.i

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jsoncpp_test.dir/jsontest.cpp.s"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/jsontest.cpp -o CMakeFiles/jsoncpp_test.dir/jsontest.cpp.s

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/flags.make
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o: _deps/jsoncpp-src/src/test_lib_json/fuzz.cpp
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o -MF CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o.d -o CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o -c /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/fuzz.cpp

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jsoncpp_test.dir/fuzz.cpp.i"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/fuzz.cpp > CMakeFiles/jsoncpp_test.dir/fuzz.cpp.i

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jsoncpp_test.dir/fuzz.cpp.s"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/fuzz.cpp -o CMakeFiles/jsoncpp_test.dir/fuzz.cpp.s

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.o: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/flags.make
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.o: _deps/jsoncpp-src/src/test_lib_json/main.cpp
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.o: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.o"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.o -MF CMakeFiles/jsoncpp_test.dir/main.cpp.o.d -o CMakeFiles/jsoncpp_test.dir/main.cpp.o -c /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/main.cpp

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jsoncpp_test.dir/main.cpp.i"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/main.cpp > CMakeFiles/jsoncpp_test.dir/main.cpp.i

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jsoncpp_test.dir/main.cpp.s"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json/main.cpp -o CMakeFiles/jsoncpp_test.dir/main.cpp.s

# Object files for target jsoncpp_test
jsoncpp_test_OBJECTS = \
"CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o" \
"CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o" \
"CMakeFiles/jsoncpp_test.dir/main.cpp.o"

# External object files for target jsoncpp_test
jsoncpp_test_EXTERNAL_OBJECTS =

bin/jsoncpp_test: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/jsontest.cpp.o
bin/jsoncpp_test: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/fuzz.cpp.o
bin/jsoncpp_test: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/main.cpp.o
bin/jsoncpp_test: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/build.make
bin/jsoncpp_test: lib/libjsoncpp.so.1.9.5
bin/jsoncpp_test: _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX executable ../../../../bin/jsoncpp_test"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jsoncpp_test.dir/link.txt --verbose=$(VERBOSE)
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && ../../../../bin/jsoncpp_test

# Rule to build all files generated by this target.
_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/build: bin/jsoncpp_test
.PHONY : _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/build

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/clean:
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json && $(CMAKE_COMMAND) -P CMakeFiles/jsoncpp_test.dir/cmake_clean.cmake
.PHONY : _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/clean

_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/depend:
	cd /home/sok/alt_pkg_compare/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sok/alt_pkg_compare /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/test_lib_json /home/sok/alt_pkg_compare/build /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/jsoncpp-build/src/test_lib_json/CMakeFiles/jsoncpp_test.dir/depend

