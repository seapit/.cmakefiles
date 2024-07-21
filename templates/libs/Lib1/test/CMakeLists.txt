cmake_minimum_required(VERSION 3.28)

get_filename_component(LIB_NAME ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
get_filename_component(LIB_NAME ${LIB_NAME} NAME)

# Get the name of the library directory
TEST(${LIB_NAME})
