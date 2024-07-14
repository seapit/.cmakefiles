message(STATUS "Building target '" ${CMAKE_CURRENT_APP} "' App")

if(NOT MODULE_OUTPUT_MODE STREQUAL "static" AND NOT MODULE_OUTPUT_MODE STREQUAL "shared" )
  message(FATAL_ERROR "Module type not provided but trying to compile a module..")
endif()