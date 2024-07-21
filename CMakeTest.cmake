# CMakeTest.cmake
cmake_minimum_required(VERSION 3.10)

# Define the TEST function
function(TEST LIB_NAME USE_C_FILES USE_GENERATED_FILES)
    if(BUILD_TESTS)
        message(STATUS "Configuring target '${LIB_NAME}_Test' (Unit-Tests)..")
        include(GoogleTest)

        # Set extra arguments for gtest
        set(GTEST_EXTRA_ARGS "")

        file(GLOB_RECURSE TEST_SOURCES "src/*.cpp")
        # Find all test source files
        if(USE_C_FILES)
            file(APPEND TEST_SOURCES "src/*.c")
        endif()

        # Include generated files if specified
        if(USE_GENERATED_FILES)
            list(APPEND TEST_SOURCES "generated/*.cpp")
        endif()

        # Create a test executable
        add_executable(${LIB_NAME}_Test ${TEST_SOURCES})

        # Include directories
        target_include_directories(${LIB_NAME}_Test PRIVATE ../inc)

        # Link libraries
        target_link_libraries(${LIB_NAME}_Test PRIVATE ${LIB_NAME} gtest gtest_main gmock ${TEST_TARGET_LIBS})

        # Discover tests and pass extra arguments
        gtest_discover_tests(${LIB_NAME}_Test EXTRA_ARGS ${GTEST_EXTRA_ARGS})

        message(STATUS "Configured module: ${LIB_NAME}")
    else()
        message(STATUS "Skipping build of target '${LIB_NAME}_Test' (Unit-Tests)..")
    endif()
endfunction()
