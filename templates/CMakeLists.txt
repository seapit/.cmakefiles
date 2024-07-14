cmake_minimum_required(VERSION 3.28)

#Project Name
get_filename_component(CURRENT_DIR ${CMAKE_BINARY_DIR} ABSOLUTE)
get_filename_component(REPO_NAME ${CURRENT_DIR} NAME)
project(${REPO_NAME})

# Set C++ standard
set(CMAKE_CXX_STANDARD 23)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Include functions
include(.cmakefiles/Functions.cmake)
# Include some config files for the cmake (This is from tutorial)
configure_file(Proj.h.in Proj.inc)

# Include directories
include_directories(${CMAKE_SOURCE_DIR}/libs)
include_directories(${CMAKE_SOURCE_DIR}/apps)

# Add Google Test
include(FetchContent)
FetchContent_Declare(
  googletest
  URL https://github.com/google/googletest/archive/refs/tags/release-1.11.0.zip
)
FetchContent_MakeAvailable(googletest)

enable_testing()

# Add application and library subdirectories
add_subdirectory(apps)
add_subdirectory(libs)
