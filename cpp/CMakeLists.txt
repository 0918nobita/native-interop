project(cpp)
cmake_minimum_required(VERSION 3.5)
add_executable(main main.cc)
target_link_libraries(main "${CMAKE_CURRENT_SOURCE_DIR}/../dylib/libmylib.so")
