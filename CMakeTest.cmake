message(STATUS "Building target '" ${TEST_TARGET} "' (Unit-Tests)..")
include(GoogleTest)

gtest_discover_tests(${TEST_TARGET} EXTRA_ARGS ${GTEST_EXTRA_ARGS})