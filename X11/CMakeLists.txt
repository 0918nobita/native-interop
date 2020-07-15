cmake_minimum_required(VERSION 3.5)
find_package(X11 REQUIRED)
add_executable(main main.c)
target_link_libraries(main ${X11_LIBRARIES})
