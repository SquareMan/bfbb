cmake_minimum_required(VERSION 3.23)

include(cmake/DetectVersion.cmake)
borealis_detect_version()
configure_file(
        ${CMAKE_CURRENT_SOURCE_DIR}/cmake/version.h.in
        ${CMAKE_CURRENT_BINARY_DIR}/generated/borealis/version.h
        @ONLY
)

project(bfbb-pc LANGUAGES C CXX VERSION ${BOREALIS_APP_VERSION})
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")

# 32-bit only for now
# TODO: after getting the port off the ground, make it 64 bit compatible
set(CMAKE_CXX_FLAGS -m32)
set(CMAKE_C_FLAGS -m32)

include(${CMAKE_SOURCE_DIR}/files.cmake)

# ------------------ librw --------------------------------
set(LIBRW_PLATFORM "D3D9" CACHE STRING "" FORCE)
add_subdirectory(third_party/librw)
target_compile_options(librw PRIVATE -Wno-everything)

# ------------------ sdl ----------------------------------
add_subdirectory(third_party/sdl)
target_compile_options(SDL3-shared PRIVATE -Wno-everything)
add_subdirectory(third_party/sdl_mixer)
# SDL mixer pollutes the global cache by setting this, which then causes librw to break
# after reconfiguring
unset(BUILD_SHARED_LIBS CACHE)
target_compile_options(SDL3_mixer-shared PRIVATE -Wno-everything)

# ----------------- librw c-style wrapper ------------------
add_library(librwc STATIC)
target_link_libraries(librwc PUBLIC librw)
target_include_directories(librwc PUBLIC include/)
target_sources(librwc
    PUBLIC
    FILE_SET headers TYPE HEADERS
    BASE_DIRS src/librwc/include/
    FILES
    ${LIBRWC_HEADERS}

    PRIVATE
    FILE_SET private_headers TYPE HEADERS
    BASE_DIRS src/librwc/src/
    FILES
    ${LIBRWC_PRIVHEADERS}

    FILES PRIVATE
    ${LIBRWC_SOURCES}
)

# ------------------------ dear imgui ---------------------
# Vendored at src/imgui with RenderWare backend taken from librw
add_library(imgui STATIC)

target_sources(imgui
    PUBLIC
    FILE_SET headers TYPE HEADERS
    BASE_DIRS src/imgui/
    FILES
    ${IMGUI_HEADERS}

    FILES PRIVATE
    ${IMGUI_SOURCES}
)
target_link_libraries(imgui PUBLIC librw SDL3::SDL3)
target_compile_options(imgui PRIVATE -Wno-everything)

# ----------------- Main Game Executable ------------------
add_executable(bfbb)
target_link_libraries(bfbb PUBLIC librwc SDL3::SDL3 SDL3_mixer::SDL3_mixer imgui)
# This is a workaround for what appears to be a lld-link issue. Including <immintrin.h> in multiple TUs causes:
#       lld-link: error: duplicate symbol: __Avx2WmemEnabledWeakValue
# lld-link seems to not be treating this symbol as something to be deduplicated.
# For now we'll force it to allow this, but this is pretty cringe
target_link_options(bfbb PRIVATE -Wl,/force:multiple)
target_compile_definitions(bfbb PRIVATE _CRT_SECURE_NO_WARNINGS _CRT_NONSTDC_NO_WARNINGS)
target_compile_definitions(bfbb PRIVATE PC_PORT WITH_LIBRW AVOID_UB)
target_include_directories(bfbb PRIVATE ${CMAKE_CURRENT_BINARY_DIR}/generated/)

target_include_directories(bfbb SYSTEM PRIVATE
    include/
)
target_sources(bfbb
    PUBLIC
    FILE_SET headers TYPE HEADERS
    BASE_DIRS src/SB/Game/ src/SB/core/x src/SB/core/sdl
    FILES
    ${GAME_HEADERS}
    ${PLATFORM_HEADERS}

    PRIVATE
    ${GAME_SOURCES}
    ${PLATFORM_SOURCES}
)

# ------ collision test -------------------
add_executable(test_collision)
target_link_libraries(test_collision PRIVATE librwc)
target_sources(test_collision
    PRIVATE
    src/librwc/test/collision.cpp
)

enable_testing()
add_test(NAME test_collision COMMAND test_collision)
