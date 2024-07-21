cmake_minimum_required(VERSION 3.28)

function(LIB LIB_NAME LIB_TYPE USE_C USE_GEN)
    message(STATUS "Configuring library.. ${LIB_NAME}")

    # Find all source files
    file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")

    if(USE_C)
        file(GLOB_RECURSE C_SOURCES "${CMAKE_CURRENT_LIST_DIR}/src/*.c")
        list(APPEND SOURCES ${C_SOURCES})
    endif()

    if(USE_GEN)
        file(GLOB_RECURSE GENERATED_SOURCES "${CMAKE_CURRENT_LIST_DIR}/generated/*.cpp")
        list(APPEND SOURCES ${GENERATED_SOURCES})
    endif()

    # Create a library
    if(${LIB_NAME}_TYPE STREQUAL "STATIC")
        add_library(${LIB_NAME} STATIC ${SOURCES})

        # Include directories
        target_include_directories(${LIB_NAME} PRIVATE "${CMAKE_CURRENT_LIST_DIR}/inc")

    elseif(${LIB_NAME}_TYPE STREQUAL "SHARED")
        add_library(${LIB_NAME} SHARED ${SOURCES})

        # Include directories
        target_include_directories(${LIB_NAME} PUBLIC "${CMAKE_CURRENT_LIST_DIR}/inc")
    else()
        add_library(${LIB_NAME} INTERFACE)

        # Include directories
        target_include_directories(${LIB_NAME} INTERFACE "${CMAKE_CURRENT_LIST_DIR}/inc")
    endif()


    # External dependencies
    # if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/ext/CMakeLists.txt")
    #     add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/ext")
    # endif()

    message(STATUS "Configured library: ${LIB_NAME}")
endfunction()

