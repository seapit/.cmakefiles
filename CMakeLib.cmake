function(LIB LIB_NAME LIB_TYPE USE_C_FILES USE_GENERATED_FILES)

    # Logic specific to handling a module
    # Replace with actual logic for configuring the module target
    message(STATUS "Configuring module: ${LIB_NAME}")

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

    # External dependencies
    if(EXISTS "${CMAKE_CURRENT_SOURCE_DIR}/ext/CMakeLists.txt")
        add_subdirectory("${CMAKE_CURRENT_SOURCE_DIR}/ext")
    endif()
    
    # Link libraries
    target_link_libraries(${LIB_NAME} PRIVATE ${LIBS})
    
    # Example usage of a function defined in CMakeApp.cmake
    #include(CMakeAppFunctions)  # Include another script if needed
    #app_specific_function(${APP_NAME})
    
    message(STATUS "Configured module: ${LIB_NAME}")
endfunction()

