message(STATUS "Building target '" ${CMAKE_CURRENT_APP} "' App")

add_executable(${CURRENT_APP} ${SRC_FILES})

if(MODULE_OUTPUT_MODE STREQUAL "static")
  add_library(${CURRENT_MODULE} STATIC ${SRC_FILES})
elseif(MODULE_OUTPUT_MODE STREQUAL "shared")
  add_library(${CURRENT_MODULE} SHARED ${SRC_FILES})
elseif(NOT MODULE_OUTPUT_MODE STREQUAL "static" AND NOT MODULE_OUTPUT_MODE STREQUAL "shared" )
  message(FATAL_ERROR "Module type not provided but trying to compile a module..")
endif()