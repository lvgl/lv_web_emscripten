cmake_minimum_required(VERSION 3.12)
project (lvgl)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O2 -s USE_SDL=2")

include_directories(${PROJECT_SOURCE_DIR})

file(GLOB_RECURSE INCLUDES "./*.h")
file(GLOB_RECURSE LIB_SOURCES "lvgl/*.c" "lv_examples/*.c" "lv_drivers/*.c")
file(GLOB MY_SOURCES "./*.c")
set(SOURCES ${LIB_SOURCES} ${MY_SOURCES})

add_executable(index ${SOURCES} ${INCLUDES})

if(NOT LVGL_CHOSEN_DEMO)
    set(LVGL_CHOSEN_DEMO lv_demo_widgets)
endif()
set_source_files_properties(main.c PROPERTIES COMPILE_FLAGS -DCHOSEN_DEMO=${LVGL_CHOSEN_DEMO})

set(CMAKE_EXECUTABLE_SUFFIX ".html")
set_target_properties(index PROPERTIES LINK_FLAGS "--shell-file ${PROJECT_SOURCE_DIR}/lvgl_shell.html -s SINGLE_FILE=1")
