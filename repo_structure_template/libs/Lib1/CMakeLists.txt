cmake_minimum_required(VERSION 3.28)

# Get the name of the library directory
get_filename_component(LIB_NAME ${CMAKE_CURRENT_LIST_DIR} NAME)

set(${LIB_NAME}_USE_C
    FALSE
    CACHE BOOL "If this item doesn't need C Files") # ALT: SET(${LIB_NAME}_USE_C
                                                    # TRUE CACHE BOOL "If this
                                                    # item doesn't need C
                                                    # Files")
set(${LIB_NAME}_USE_GEN
    FALSE
    CACHE BOOL "If this item doesn't need generated files"
)# ALT: SET(${LIB_NAME}_USE_GEN TRUE CACHE BOOL "If this item doesn't need
 # generated files")

set(${LIB_NAME}_TYPE INTERFACE) # ALT: SET(${LIB_NAME}_TYPE STATIC)
                                # SET(${LIB_NAME}_TYPE SHARED)

# Call the MODULE function with appropriate arguments
lib(${LIB_NAME} ${${LIB_NAME}_TYPE} ${${LIB_NAME}_USE_C} ${${LIB_NAME}_USE_GEN})

# Add subdirectory for tests if enabled
if(BUILD_TESTING)
  add_subdirectory(test)
endif()

# incThreads()

# list(APPEND ${LIB_NAME}_LIBS_TO_ADD A_NAME_HERE) list(APPEND
# ${LIB_NAME}_LIBS_TO_ADD ANOTHER_NAME_HERE)

# incModule(${${LIB_NAME}_LIBS_TO_ADD})
