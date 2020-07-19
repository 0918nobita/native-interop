project(c-exe)
cmake_minimum_required(VERSION 3.5)
add_executable(main main.c)
target_link_libraries(main "${CMAKE_CURRENT_SOURCE_DIR}/../dylib/libmylib.so")
