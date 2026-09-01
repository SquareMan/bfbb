cmake_minimum_required(VERSION 3.15)
project(bfbb-pc)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 32-bit only for now
# TODO: after getting the port off the ground, make it 64 bit compatible
add_compile_options(-m32)

set(LIBRW_TOOLS OFF CACHE BOOL "" FORCE)
set(LIBRW_INSTALL OFF CACHE BOOL "" FORCE)
add_subdirectory(third_party/librw)

# suppress librw warnings
target_compile_options(librw PRIVATE -Wno-everything)
