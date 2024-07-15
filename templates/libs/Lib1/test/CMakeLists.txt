cmake_minimum_required(VERSION 3.28)

# Get the name of the library directory
get_filename_component(LIB_NAME ${CMAKE_CURRENT_SOURCE_DIR}/.. NAME)

# Create a test executable
add_executable(${LIB_NAME}_test)

# Specify test sources explicitly
target_sources(${LIB_NAME}_test
    PRIVATE
        src/test_example.cpp
        # Add other test source files here
)
# Include directories
target_include_directories(${LIB_NAME}_test PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../inc)

# Link libraries
target_link_libraries(${LIB_NAME}_test PRIVATE ${LIB_NAME} gtest gtest_main)

# Add tests
add_test(NAME ${LIB_NAME}_test COMMAND ${LIB_NAME}_test)
