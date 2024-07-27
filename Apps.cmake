# Example function in CMakeApp.cmake
cmake_minimum_required(VERSION 3.28)

function(APP APP_NAME USE_C USE_GEN)
  # Logic specific to handling an app Replace with actual logic for configuring
  # the app target
  message(STATUS "Configuring app: ${APP_NAME}")

  # Find all source files
  file(GLOB_RECURSE SOURCES "${CMAKE_CURRENT_LIST_DIR}/src/*.cpp")

  # If set to use C Files
  if(${USE_C})
    file(GLOB_RECURSE C_SOURCES "${CMAKE_CURRENT_SOURCE_DIR}/src/*.c")
    list(APPEND SOURCES ${C_SOURCES})
  endif()

  # If set to use generated Files
  if(${USE_GEN})
    file(GLOB_RECURSE GENERATED_SOURCES
         "${CMAKE_CURRENT_SOURCE_DIR}/generated/*.cpp")
    list(APPEND SOURCES ${GENERATED_SOURCES})
  endif()

  # Create the target
  add_executable(${APP_NAME})

  # Set include directories, link libraries, etc.
  target_include_directories(
    ${APP_NAME} PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/apps/${APP_NAME}/inc)

  # Add any other configurations needed
  target_link_libraries(${LIB_NAME} PUBLIC)

  target_compile_options(
    ${LIB_NAME}_Test PRIVATE $<$<CONFIG:Debug>:${CMAKE_CXX_FLAGS_DEBUG}>
                             $<$<CONFIG:Release>:${CMAKE_CXX_FLAGS_RELEASE}>)

  # External dependencies if(EXISTS
  # "${CMAKE_CURRENT_LIST_DIR}/ext/CMakeLists.txt")
  # add_subdirectory("${CMAKE_CURRENT_LIST_DIR}/ext") endif()

  message(STATUS "Configured app: ${APP_NAME}")
endfunction()
