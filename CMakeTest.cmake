message(STATUS "Building target '" ${TEST_TARGET} "' (Unit-Tests)..")
include(GoogleTest)

gtest_discover_tests(${TEST_TARGET} EXTRA_ARGS ${GTEST_EXTRA_ARGS})

target_link_libraries(${TEST_TARGET} ${CURRENT_MODULE} gtest gtest_main gtest_gmock ${TEST_TARGET_LIBS})

# Find all test source files
file(GLOB_RECURSE TEST_SOURCES "src/*.cpp")

# Create a test executable
add_executable(Lib1_Test ${TEST_SOURCES})

# Include directories
target_include_directories(Lib1Test PRIVATE ../inc)

# Link libraries
target_link_libraries(Lib1Test PRIVATE Lib1)