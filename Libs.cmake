cmake_minimum_required(VERSION 3.28)

function(LIB LIB_NAME LIB_TYPE USE_C USE_GEN)
    message(STATUS "Configuring library.. ${LIB_NAME}")

    # Find all source files
    file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")

    # If set to use C Files
    if(USE_C)
        file(GLOB_RECURSE C_SOURCES "${CMAKE_CURRENT_LIST_DIR}/src/*.c")
        list(APPEND SOURCES ${C_SOURCES})
    endif()

    # If set to use generated Files
    if(USE_GEN)
        file(GLOB_RECURSE GENERATED_SOURCES "${CMAKE_CURRENT_LIST_DIR}/generated/*.cpp")
        list(APPEND SOURCES ${GENERATED_SOURCES})
    endif()

    if(${LIB_NAME}_TYPE STREQUAL "STATIC")
        add_library(${LIB_NAME} STATIC ${SOURCES})

        target_include_directories(${LIB_NAME} PRIVATE "${CMAKE_CURRENT_LIST_DIR}/inc")

        target_compile_options(${LIB_NAME} PRIVATE
            $<$<CONFIG:Debug>:${CMAKE_CXX_FLAGS_DEBUG}>
            $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>
            )

    elseif(${LIB_NAME}_TYPE STREQUAL "SHARED")
        add_library(${LIB_NAME} SHARED ${SOURCES})

        target_include_directories(${LIB_NAME} PUBLIC "${CMAKE_CURRENT_LIST_DIR}/inc")

        target_compile_options(${LIB_NAME} PUBLIC
            $<$<CONFIG:Debug>:${CMAKE_CXX_FLAGS_DEBUG}>
            $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>
            )

    elseif(${LIB_NAME}_TYPE STREQUAL "MODULE")
        add_library(${LIB_NAME} MODULE ${SOURCES})

        target_include_directories(${LIB_NAME} PUBLIC "${CMAKE_CURRENT_LIST_DIR}/inc")

        target_compile_options(${LIB_NAME} PUBLIC
            $<$<CONFIG:Debug>:${CMAKE_CXX_FLAGS_DEBUG}>
            $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>
            )
    else()
        add_library(${LIB_NAME} INTERFACE)

        target_include_directories(${LIB_NAME} INTERFACE "${CMAKE_CURRENT_LIST_DIR}/inc")

        target_compile_options(${LIB_NAME} INTERFACE
            $<$<CONFIG:Debug>:${CMAKE_CXX_FLAGS_DEBUG}>
            $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>
            )
    endif()



    # External dependencies
    # if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/ext/CMakeLists.txt")
    #     add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/ext")
    # endif()

    message(STATUS "Configured library: ${LIB_NAME}")
endfunction()
