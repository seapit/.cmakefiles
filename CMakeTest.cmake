include_directories(src)

message(STATUS "Building target '" ${TEST_TARGET} "' (Unit-Tests)..")
add_executable(${TARGETNAME}Test ${SRC_FILES})

target_link_libraries(${TEST_TARGET} ${CURRENT_MODULE} gtest gtest_main gtest_gmock ${TEST_TARGET_LIBS})

add_Test(NAME ${TARGET_NAME}Test COMMAND ${TARGET_NAME}Test)

gtest_discover_tests(${TEST_TARGET} EXTRA_ARGS ${GTEST_EXTRA_ARGS})