cmake_minimum_required(VERSION 3.10)
project(HelloWorld)

# <VERSION_BLOCK>
find_package(Git QUIET)
if(GIT_FOUND)
    execute_process(
        COMMAND ${GIT_EXECUTABLE} describe --tags --dirty --always
        WORKING_DIRECTORY ${CMAKE_SOURCE_DIR}
        OUTPUT_VARIABLE GIT_VERSION
        OUTPUT_STRIP_TRAILING_WHITESPACE
        ERROR_QUIET
    )
endif()

if(NOT GIT_VERSION)
    set(GIT_VERSION "0.1.0-unknown")
endif()

set(PROJECT_VERSION "${GIT_VERSION}" CACHE STRING "Project version string")
message(STATUS "Project version set to: ${PROJECT_VERSION}")
# </VERSION_BLOCK>

add_subdirectory(src)
