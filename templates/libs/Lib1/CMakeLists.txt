cmake_minimum_required(VERSION 3.28)

# Get the name of the library directory
get_filename_component(LIB_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

SET(${LIB_NAME}_USE_C FALSE CACHE BOOL "If this item doesn't need C Files") # ALT: SET(${LIB_NAME}_USE_C TRUE CACHE BOOL "If this item doesn't need C Files") 
SET(${LIB_NAME}_USE_GEN FALSE CACHE BOOL "If this item doesn't need generated files") # ALT: SET(${LIB_NAME}_USE_GEN TRUE CACHE BOOL "If this item doesn't need generated files")

SET(${LIB_NAME}_TYPE INTERFACE) # ALT: SET(${LIB_NAME}_TYPE STATIC) SET(${LIB_NAME}_TYPE SHARED)

# Call the MODULE function with appropriate arguments
LIB(${LIB_NAME} ${${LIB_NAME}_TYPE} ${${LIB_NAME}_USE_C} ${${LIB_NAME}_USE_GEN})

# Add subdirectory for tests if enabled
if(BUILD_TESTING)
    add_subdirectory(test)
endif()