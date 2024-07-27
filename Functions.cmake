cmake_minimum_required(VERSION 3.28)

include(${CMAKE_CURRENT_LIST_DIR}/Message.cmake)

include(${CMAKE_CURRENT_LIST_DIR}/Apps.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Libs.cmake)
include(${CMAKE_CURRENT_LIST_DIR}/Testing.cmake)

function(includecfiles)
  file(GLOB_RECURSE C_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
  list(APPEND SRC ${C_SOURCES})
endfunction()

function(includegeneratedfiles)
  file(GLOB_RECURSE GENERATED_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/generated/*)
  list(APPEND SOURCES ${GENERATED_SOURCES})
endfunction()

function(incThreads)
  # Enable P-threads Find the pthread package
  find_package(Threads REQUIRED)
endfunction()

function(incModule LIBS_TO_ADD)
  foreach(NAME ${${LIBS_TO_ADD}})
    target_include_directories(${LIB_NAME} PUBLIC ${LIBDIR}/${NAME}/inc/)
    target_link_libraries(${LIB_NAME} PRIVATE ${NAME})
  endforeach()
endfunction()
