# cmake_minimum_required(VERSION 3.28) Include functions # Apps if(APP)
# foreach(DIRNAME ${DIR_APP}) #Set Variables
# get_filename_component(DIRNAME_STRIP ${DIRNAME} NAME) set(CURRENT_APP
# ${DIRNAME_STRIP}) add_subdirectory(${DIRNAME}) endforeach() endif()
#
# # Define a target to build all applications add_custom_target(all_apps COMMAND
# ${CMAKE_COMMAND} --build ${CMAKE_BINARY_DIR} --target ${ALL_APP} COMMENT
# "Building all applications" )
