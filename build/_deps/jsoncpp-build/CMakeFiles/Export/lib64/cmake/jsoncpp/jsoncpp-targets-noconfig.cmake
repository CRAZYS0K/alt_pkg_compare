#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Import target "jsoncpp_lib" for configuration ""
set_property(TARGET jsoncpp_lib APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(jsoncpp_lib PROPERTIES
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib64/libjsoncpp.so.1.9.5"
  IMPORTED_SONAME_NOCONFIG "libjsoncpp.so.25"
  )

list(APPEND _IMPORT_CHECK_TARGETS jsoncpp_lib )
list(APPEND _IMPORT_CHECK_FILES_FOR_jsoncpp_lib "${_IMPORT_PREFIX}/lib64/libjsoncpp.so.1.9.5" )

# Import target "jsoncpp_static" for configuration ""
set_property(TARGET jsoncpp_static APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(jsoncpp_static PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_NOCONFIG "CXX"
  IMPORTED_LOCATION_NOCONFIG "${_IMPORT_PREFIX}/lib64/libjsoncpp.a"
  )

list(APPEND _IMPORT_CHECK_TARGETS jsoncpp_static )
list(APPEND _IMPORT_CHECK_FILES_FOR_jsoncpp_static "${_IMPORT_PREFIX}/lib64/libjsoncpp.a" )

# Import target "jsoncpp_object" for configuration ""
set_property(TARGET jsoncpp_object APPEND PROPERTY IMPORTED_CONFIGURATIONS NOCONFIG)
set_target_properties(jsoncpp_object PROPERTIES
  IMPORTED_COMMON_LANGUAGE_RUNTIME_NOCONFIG ""
  IMPORTED_OBJECTS_NOCONFIG "${_IMPORT_PREFIX}/lib64/objects/jsoncpp_object/json_reader.cpp.o;${_IMPORT_PREFIX}/lib64/objects/jsoncpp_object/json_value.cpp.o;${_IMPORT_PREFIX}/lib64/objects/jsoncpp_object/json_writer.cpp.o"
  )

list(APPEND _IMPORT_CHECK_TARGETS jsoncpp_object )
list(APPEND _IMPORT_CHECK_FILES_FOR_jsoncpp_object "${_IMPORT_PREFIX}/lib64/objects/jsoncpp_object/json_reader.cpp.o;${_IMPORT_PREFIX}/lib64/objects/jsoncpp_object/json_value.cpp.o;${_IMPORT_PREFIX}/lib64/objects/jsoncpp_object/json_writer.cpp.o" )

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
