# Get the name of the library directory
get_filename_component(LIB_NAME ${CMAKE_CURRENT_SOURCE_DIR}/.. NAME)

# Find all test source files
file(GLOB_RECURSE TEST_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

# Create a test executable
add_executable(${LIB_NAME}_test ${TEST_SOURCES})

# Include directories
target_include_directories(${LIB_NAME}_test PRIVATE "${CMAKE_CURRENT_SOURCE_DIR}/../inc")

# Link libraries
target_link_libraries(${LIB_NAME}_test PRIVATE ${LIB_NAME} gtest gtest_main)

# Add tests
add_test(NAME ${LIB_NAME}_test COMMAND ${LIB_NAME}_test)