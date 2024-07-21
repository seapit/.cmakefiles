# CMakeTest.cmake
cmake_minimum_required(VERSION 3.10)

# Define the TEST function
function(TEST LIB_NAME)
    if(BUILD_TESTS)
        message(STATUS "Configuring target '${LIB_NAME}_Test' (Unit-Tests)..")

        # Set extra arguments for gtest
        set(GTEST_EXTRA_ARGS "")

        file(GLOB_RECURSE TEST_SOURCES "${CMAKE_CURRENT_LIST_DIR}/*.cpp")

        # Create a test executable
        add_executable(${LIB_NAME}_Test ${TEST_SOURCES})

        # Include directories
        target_include_directories(${LIB_NAME}_Test PRIVATE ../inc)

        # Link libraries
        target_link_libraries(${LIB_NAME}_Test PRIVATE ${LIB_NAME} gtest_main gmock)

        include(GoogleTest)
        
        # Discover tests and pass extra arguments
        gtest_discover_tests(${LIB_NAME}_Test EXTRA_ARGS ${GTEST_EXTRA_ARGS})

        message(STATUS "Configured module: ${LIB_NAME}")
    else()
        message(STATUS "Skipping build of target '${LIB_NAME}_Test' (Unit-Tests)..")
    endif()
endfunction()
