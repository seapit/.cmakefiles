function(LIB LIB_NAME LIB_TYPE USE_C_FILES USE_GENERATED_FILES)
    # Find all source files
    file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.cpp")

    if(${USE_C_FILES})
        file(GLOB_RECURSE C_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")
        list(APPEND SOURCES ${C_SOURCES})
    endif()

    if(${USE_GENERATED_FILES})
        file(GLOB_RECURSE GENERATED_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/generated/*.cpp")
        list(APPEND SOURCES ${GENERATED_SOURCES})
    endif()

    # Create a library
    if(${LIB_TYPE} STREQUAL "STATIC")
        add_library(${LIB_NAME} STATIC ${SOURCES})
    else()
        add_library(${LIB_NAME} SHARED ${SOURCES})
    endif()

    # Include directories
    target_include_directories(${LIB_NAME} PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/inc")

    # Link libraries
    target_link_libraries(${LIB_NAME} PRIVATE ${LIBS})
endfunction()