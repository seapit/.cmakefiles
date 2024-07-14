set(MODULE_OUTPUT_MODE "static")
#set(MODULE_OUTPUT_MODE "shared)
set(ARG1 "")
#set(ARG1 ".c")
set(ARG2 "")
#set(ARG2 "GENERATED)

add_subdirectory(inc)
add_subdirectory(src)
add_subdirectory(test)

add_executable(TARGET_NAME ${CURRENT_APP} ${SRC_FILES})
target_link_libraries(${TEST_TARGET} ${CURRENT_MODULE} gtest gtest_main gtest_gmock ${TEST_TARGET_LIBS})

if(MODULE_OUTPUT_MODE STREQUAL "static")
  add_library(${CURRENT_MODULE} STATIC ${SRC_FILES})
elseif(MODULE_OUTPUT_MODE STREQUAL "shared")
  add_library(${CURRENT_MODULE} SHARED ${SRC_FILES})
endif()
  
MODULE( TARGET_NAME MODULE_OUTPUT_MODE ${ARG1} ${ARG2})