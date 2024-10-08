cmake_minimum_required(VERSION 3.28)
# Include functions
include(${CMAKE_SOURCE_DIR}/.cmakefiles/Functions.cmake)

# Project Name get_filename_component(CURRENT_DIR ${CMAKE_BINARY_DIR} ABSOLUTE)
get_filename_component(REPO_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)
project(${REPO_NAME})

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++23 -Wall -Wextra -Werror")

# Define the compilation flags for Debug and Release builds
set(CMAKE_CXX_FLAGS_DEBUG "-g -O0")
set(CMAKE_CXX_FLAGS_RELEASE "-O2 -DNDEBUG")

# Set GCC coverage flags
set(GCC_COVERAGE_COMPILE_FLAGS "-coverage -fsanitize=address -fsanitize=undefined -fprofile-arcs -ftest-coverage")
set(GCC_COVERAGE_LINK_FLAGS "-coverage -fprofile-arcs -ftest-coverage")

# Export Compilation commands for SonarLint
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Set Output Directories
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/output/staticLib)
set(CMAKE_COLOR_MAKEFILE ON)

# configure a header file to pass the version number only
configure_file(Proj.h.in Proj.h)

add_subdirectory(libs)
add_subdirectory(apps)

# Set Up testing
option(BUILD_TESTING "Build Unit Tests" ON)
option(APP "Build Apps" ON)

if(BUILD_TESTING)
  message(STATUS "Enabling Unit Tests")

  include(CTest)

  # Add Google Test
  include(FetchContent)
  FetchContent_Declare(
    googletest
    URL https://github.com/google/googletest/archive/refs/tags/v1.15.0.zip)
  FetchContent_MakeAvailable(googletest)

  # Combine debug and coverage flags
  set(CMAKE_CXX_FLAGS_DEBUG "${GCC_COVERAGE_COMPILE_FLAGS}")
  set(GTEST_EXTRA_ARGS "--gtest_output=xml:${CMAKE_BINARY_DIR}/build/reports/unitTests")
endif()
