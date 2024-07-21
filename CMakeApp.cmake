# Example function in CMakeApp.cmake
cmake_minimum_required(VERSION 3.28)

function(APP APP_NAME USE_C USE_GEN)
    # Logic specific to handling an app
    # Replace with actual logic for configuring the app target
    message(STATUS "Configuring app: ${APP_NAME}")
    
    # Example configuration
    add_executable(${APP_NAME})
    
    if(${USE_C})
        file(GLOB_RECURSE C_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")
        list(APPEND SOURCES ${C_SOURCES})
    endif()

    if(${USE_GEN})
        file(GLOB_RECURSE GENERATED_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/generated/*.cpp")
        list(APPEND SOURCES ${GENERATED_SOURCES})
    endif()

    # Set include directories, link libraries, etc.
    target_include_directories(${APP_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/apps/${APP_NAME}/inc)

    # Add any other configurations needed
    target_link_libraries(${LIB_NAME} PUBLIC)

    # External dependencies
    # if(EXISTS "${CMAKE_CURRENT_LIST_DIR}/ext/CMakeLists.txt")
    #     add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/ext")
    # endif()

    message(STATUS "Configured app: ${APP_NAME}")
endfunction()
