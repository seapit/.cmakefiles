set(ARG1 "")
#set(ARG1 ".c")
set(ARG2 "")
#set(ARG2 "GENERATED)

add_subdirectory(inc)
add_subdirectory(src)

target_link_libraries(TARGET_NAME PRIVATE ${MODULE})
add_executable(TARGET_NAME ${CURRENT_APP} ${SRC_FILES})
APP( TARGET_NAME ${ARG1} ${ARG2})