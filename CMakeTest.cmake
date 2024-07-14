message(STATUS "Building target '" ${TEST_TARGET} "' (Unit-Tests)..")
include(GoogleTest)

gtest_discover_tests(${TEST_TARGET} EXTRA_ARGS ${GTEST_EXTRA_ARGS})

target_link_libraries(${TEST_TARGET} ${CURRENT_MODULE} gtest gtest_main gtest_gmock ${TEST_TARGET_LIBS})