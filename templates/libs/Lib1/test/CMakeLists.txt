cmake_minimum_required(VERSION 3.28)

# CAN JUST USE CACHE HERE, SHOULD BE SET ABOVE
#SET(${LIB_NAME}_USE_C_FILES CACHE TRUE CACHE BOOL "If this item needs C Files")
SET(${LIB_NAME}_USE_C_FILES FALSE CACHE BOOL "If this item doesn't need C Files")
#SET(${LIB_NAME}_USE_GENERATED_FILES TRUE CACHE BOOL "If this item needs generated files")
SET(${LIB_NAME}_USE_GENERATED_FILES FALSE CACHE BOOL "If this item doesn't need generated files")

get_filename_component(LIB_NAME ${CMAKE_CURRENT_SOURCE_DIR} DIRECTORY)
get_filename_component(LIB_NAME ${LIB_NAME} NAME)

# Get the name of the library directory
TEST(${LIB_NAME}_TEST ${LIB_NAME}_USE_C_FILES ${LIB_NAME}_USE_GENERATED_FILES)
