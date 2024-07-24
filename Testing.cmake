# CMakeTest.cmake
cmake_minimum_required(VERSION 3.10)

# Define the TEST function
function(TEST LIB_NAME)
    if(BUILD_TESTING)
        enable_testing()
        message(STATUS "Configuring target '${LIB_NAME}_Test' (Unit-Tests)..")

        # Set extra arguments for gtest
        set(GTEST_EXTRA_ARGS "")

        file(GLOB_RECURSE TEST_SOURCES "${CMAKE_CURRENT_LIST_DIR}/*.cpp")

        # Create a test executable
        get_filename_component(LIB_DIR ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)

        # Let's get a target for this test
        add_executable(${LIB_NAME}_Test ${TEST_SOURCES})

        # Let's include the lib's includes
        target_include_directories(${LIB_NAME}_Test PRIVATE ${LIB_DIR}/inc)

        # Link libraries
        target_link_libraries(${LIB_NAME}_Test PRIVATE ${LIB_NAME} GTest::gtest_main)

        # Discover tests and pass extra arguments
        include(GoogleTest)
        gtest_discover_tests(${LIB_NAME}_Test EXTRA_ARGS ${GTEST_EXTRA_ARGS})

        add_test(NAME ${LIB_NAME}_Test COMMAND ${LIB_NAME}_Test)

        message(STATUS "Configured module: ${LIB_NAME}")
    else()
        message(STATUS "Skipping build of target '${LIB_NAME}_Test' (Unit-Tests)..")
    endif()
endfunction()
