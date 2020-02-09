cmake_minimum_required(VERSION 3.12)
project (lvgl)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -s USE_SDL=2")

include_directories(${PROJECT_SOURCE_DIR})

file(GLOB INCLUDES1 "./*.h")
file(GLOB_RECURSE INCLUDES2 "lv_drivers/*.h" "lv_examples/*.c" "lvgl/*.h")

file(GLOB SOURCES1  "./*.c")
file(GLOB_RECURSE SOURCES2  "lv_drivers/*.c" "lv_examples/*.c" "lvgl/*.c")

set(INCLUDES ${INCLUDES1} ${INCLUDES2})
set(SOURCES ${SOURCES1} ${SOURCES2})

add_executable(lvgl ${SOURCES} ${INCLUDES})

set(CMAKE_EXECUTABLE_SUFFIX ".html")
set_target_properties(lvgl PROPERTIES LINK_FLAGS "--shell-file ../lvgl_shell.html")
