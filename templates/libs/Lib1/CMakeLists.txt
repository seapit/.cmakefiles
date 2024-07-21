cmake_minimum_required(VERSION 3.28)

# Get the name of the library directory
get_filename_component(LIB_NAME ${CMAKE_CURRENT_SOURCE_DIR} NAME)

#SET(${LIB_NAME}_USE_C_FILES CACHE TRUE)
SET(${LIB_NAME}_USE_C_FILES CACHE FALSE)
#SET(${LIB_NAME}_USE_GENERATED_FILES CACHE TRUE)
SET(${LIB_NAME}_USE_GENERATED_FILES CACHE FALSE)

SET(${LIB_TYPE} STATIC)
#SET(${LIB_TYPE} SHARED)

# Call the MODULE function with appropriate arguments
LIB(${LIB_NAME} ${LIB_TYPE} ${LIB_NAME}_USE_C_FILES ${LIB_NAME}_USE_GENERATED_FILES)

# Add subdirectory for tests if enabled
if(BUILD_TESTS)
    add_subdirectory(test)
endif()