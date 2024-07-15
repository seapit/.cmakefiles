# Example function in CMakeApp.cmake

function(APP APP_NAME USE_C_FILES USE_GENERATED_FILES)
    # Logic specific to handling an app
    # Replace with actual logic for configuring the app target
    message(STATUS "Configuring app: ${APP_NAME}")
    
    # Example configuration
    add_executable(${APP_NAME})
    
    if(${USE_C_FILES})
        file(GLOB_RECURSE C_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")
        list(APPEND SOURCES ${C_SOURCES})
    endif()

    if(${USE_GENERATED_FILES})
        file(GLOB_RECURSE GENERATED_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/generated/*.cpp")
        list(APPEND SOURCES ${GENERATED_SOURCES})
    endif()

    # Set include directories, link libraries, etc.
    target_include_directories(${APP_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/apps/${APP_NAME}/inc)
    
    # Add any other configurations needed
    
    # Example usage of a function defined in CMakeApp.cmake
    #include(CMakeAppFunctions)  # Include another script if needed
    #app_specific_function(${APP_NAME})
    
    message(STATUS "Configured app: ${APP_NAME}")
endfunction()
