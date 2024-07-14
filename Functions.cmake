include(./CMakeApp.cmake)
include(./CMakeModule.cmake)
include(./CMakeTest.cmake)

if(NOT WIN32)
  string(ASCII 27 Esc)
  set(ColourReset "${Esc}[m")
  set(ColourBold  "${Esc}[1m")
  set(Red         "${Esc}[31m")
  set(Green       "${Esc}[32m")
  set(Yellow      "${Esc}[33m")
  set(Blue        "${Esc}[34m")
  set(Magenta     "${Esc}[35m")
  set(Cyan        "${Esc}[36m")
  set(White       "${Esc}[37m")
  set(BoldRed     "${Esc}[1;31m")
  set(BoldGreen   "${Esc}[1;32m")
  set(BoldYellow  "${Esc}[1;33m")
  set(BoldBlue    "${Esc}[1;34m")
  set(BoldMagenta "${Esc}[1;35m")
  set(BoldCyan    "${Esc}[1;36m")
  set(BoldWhite   "${Esc}[1;37m")
endif()

function(message)
  list(GET ARGV 0 MessageType)
  if(MessageType STREQUAL FATAL_ERROR OR MessageType STREQUAL SEND_ERROR)
    list(REMOVE_AT ARGV 0)
    _message(${MessageType} "${BoldRed}${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL WARNING)
    list(REMOVE_AT ARGV 0)
    _message(${MessageType} "${BoldYellow}${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL AUTHOR_WARNING)
    list(REMOVE_AT ARGV 0)
    _message(${MessageType} "${BoldCyan}${ARGV}${ColourReset}")
  elseif(MessageType STREQUAL STATUS)
    list(REMOVE_AT ARGV 0)
    _message(${MessageType} "${Green}${ARGV}${ColourReset}")
  else()
    _message("${ARGV}")
  endif()
endfunction(message)

function(includecfiles)
        file(GLOB_RECURSE C_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/src/*.c)
        list(APPEND SRC ${C_SOURCES})
endfunction()

function(includegeneratedfiles)
file(GLOB_RECURSE GENERATED_SOURCES ${CMAKE_CURRENT_SOURCE_DIR}/generated/*)
list(APPEND SOURCES ${GENERATED_SOURCES})
endfunction()

function(APP USE_C_FILES USE_GENERATED_FILES)
    # Find all source files
    file(GLOB_RECURSE SRC "src/*.cpp")

    if(${USE_C_FILES})
      includecfiles()
    endif()

    if(${USE_GENERATED_FILES})
      includegeneratedfiles()
    endif()

    # Create an executable
    add_executable(App1 ${SOURCES})

    # Include directories
    target_include_directories(App1 PRIVATE inc)

    # Link libraries
    target_link_libraries(App1 PRIVATE ${LIBS})

    # External dependencies
    add_subdirectory(ext)
endfunction()


function(MODULE USE_C_FILES USE_GENERATED_FILES)
    # Find all source files
    file(GLOB_RECURSE SOURCES "src/*.cpp")

    if(${USE_C_FILES})
        file(GLOB_RECURSE C_SOURCES "src/*.c")
        list(APPEND SOURCES ${C_SOURCES})
    endif()

    if(${USE_GENERATED_FILES})
        file(GLOB_RECURSE GENERATED_SOURCES "generated/*.cpp")
        list(APPEND SOURCES ${GENERATED_SOURCES})
    endif()

    # Create a library
    add_library(Lib1 STATIC ${SOURCES})

    # Include directories
    target_include_directories(Lib1 PUBLIC inc)

    # Link libraries
    target_link_libraries(Lib1 PRIVATE ${LIBS})
endfunction()


function(TEST TARGET_NAME ARG2 ARG3)
commonsrc(${ARG2} ${ARG3})
include(${CMAKE_BINARY_DIR}/../.cmakefiles/CMakeTest.cmake)
endfunction()