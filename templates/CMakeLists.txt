cmake_minimum_required(VERSION 3.28)
# Include functions
include(${CMAKE_SOURCE_DIR}/.cmakefiles/Functions.cmake)

#Project Name
#get_filename_component(CURRENT_DIR ${CMAKE_BINARY_DIR} ABSOLUTE)
get_filename_component(REPO_NAME ${CMAKE_BINARY_DIR} NAME)
project(${REPO_NAME})

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Export Compilation commands for SonarLint
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

#Set Output Directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/build/staticLib)

# configure a header file to pass the version number only
configure_file(Proj.h.in Proj.h)

# Get all targets
file(GLOB DIR_LIB libs/*)

# Get all targets
file(GLOB DIR_APP apps/*)

# Set Up testing
option(TESTING "Build Unit Tests" ON)
option(APP "Build Apps" ON)

if(TESTING)
  # Add Google Test
  include(FetchContent)
  FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip
  )
  FetchContent_MakeAvailable(googletest)

  enable_testing()
  message(STATUS "Enabling Unit Tests")
  find_package(GTest CONFIG REQUIRED)
  include(GoogleTest)
  set(GCC_COVERAGE_COMPILE_FLAGS "-g -p0 -coverage-fprofile-arcs -ftest-coverage")
  set(GCC_COVERAGE_LINK_FLAGS "coverage -lgcov")
  set(GTEST_EXTRA_ARGS "--gtest_output=xml:${CMAKE_BINARY_DIR}/build/reports/unitTests")
endif()

# Libraries
foreach(DIRNAME ${DIR_LIB})
  #Set Variables
  get_filename_component(DIRNAME_STRIP ${DIRNAME} NAME) 
  set(CURRENT_LIB ${DIRNAME_STRIP})
  # Setup for tests
  if(NOT CURRENT_LIB STREQUAL "CMakeLists.txt")
    if(TESTING)
      if((DEFINED MODULE_IN_TEST) AND (NOT MODULE_IN_TEST STREQUAL "") AND (NOT MODULE_IN_TEST STREQUAL ${CURRENT_LIB}))
        continue()
      endif()
      set(TEST_TARGET "${CURRENT_LIB}_test")
      add_subdirectory(${DIRNAME}/test)
    endif()
  endif()
endforeach()

# Apps
if(APP)
  foreach(DIRNAME ${DIR_APP})
    #Set Variables
    get_filename_component(DIRNAME_STRIP ${DIRNAME} NAME) 
    set(CURRENT_APP ${DIRNAME_STRIP})
    
    add_subdirectory(${DIRNAME})
  endforeach()
endif()