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
include _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/depend.make
# Include any dependencies generated by the compiler for this target.
include _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/compiler_depend.make

# Include the progress variables for this target.
include _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/progress.make

# Include the compile flags for this target's objects.
include _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/flags.make

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/flags.make
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o: _deps/jsoncpp-src/src/lib_json/json_reader.cpp
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o -MF CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o.d -o CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o -c /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_reader.cpp

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jsoncpp_static.dir/json_reader.cpp.i"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_reader.cpp > CMakeFiles/jsoncpp_static.dir/json_reader.cpp.i

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jsoncpp_static.dir/json_reader.cpp.s"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_reader.cpp -o CMakeFiles/jsoncpp_static.dir/json_reader.cpp.s

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.o: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/flags.make
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.o: _deps/jsoncpp-src/src/lib_json/json_value.cpp
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.o: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.o"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.o -MF CMakeFiles/jsoncpp_static.dir/json_value.cpp.o.d -o CMakeFiles/jsoncpp_static.dir/json_value.cpp.o -c /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_value.cpp

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jsoncpp_static.dir/json_value.cpp.i"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_value.cpp > CMakeFiles/jsoncpp_static.dir/json_value.cpp.i

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jsoncpp_static.dir/json_value.cpp.s"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_value.cpp -o CMakeFiles/jsoncpp_static.dir/json_value.cpp.s

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/flags.make
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o: _deps/jsoncpp-src/src/lib_json/json_writer.cpp
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/compiler_depend.ts
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -MD -MT _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o -MF CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o.d -o CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o -c /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_writer.cpp

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/jsoncpp_static.dir/json_writer.cpp.i"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_writer.cpp > CMakeFiles/jsoncpp_static.dir/json_writer.cpp.i

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/jsoncpp_static.dir/json_writer.cpp.s"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json/json_writer.cpp -o CMakeFiles/jsoncpp_static.dir/json_writer.cpp.s

# Object files for target jsoncpp_static
jsoncpp_static_OBJECTS = \
"CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o" \
"CMakeFiles/jsoncpp_static.dir/json_value.cpp.o" \
"CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o"

# External object files for target jsoncpp_static
jsoncpp_static_EXTERNAL_OBJECTS =

lib/libjsoncpp.a: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_reader.cpp.o
lib/libjsoncpp.a: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_value.cpp.o
lib/libjsoncpp.a: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/json_writer.cpp.o
lib/libjsoncpp.a: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/build.make
lib/libjsoncpp.a: _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/sok/alt_pkg_compare/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking CXX static library ../../../../lib/libjsoncpp.a"
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && $(CMAKE_COMMAND) -P CMakeFiles/jsoncpp_static.dir/cmake_clean_target.cmake
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/jsoncpp_static.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/build: lib/libjsoncpp.a
.PHONY : _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/build

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/clean:
	cd /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json && $(CMAKE_COMMAND) -P CMakeFiles/jsoncpp_static.dir/cmake_clean.cmake
.PHONY : _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/clean

_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/depend:
	cd /home/sok/alt_pkg_compare/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/sok/alt_pkg_compare /home/sok/alt_pkg_compare/build/_deps/jsoncpp-src/src/lib_json /home/sok/alt_pkg_compare/build /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json /home/sok/alt_pkg_compare/build/_deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : _deps/jsoncpp-build/src/lib_json/CMakeFiles/jsoncpp_static.dir/depend

