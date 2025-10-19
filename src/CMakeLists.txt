configure_file(
  "version.h.in"
  "${CMAKE_CURRENT_BINARY_DIR}/version.h"
)

add_executable(hello_world hello.cpp)

target_include_directories(hello_world
    PRIVATE
        ${CMAKE_CURRENT_BINARY_DIR}
)
