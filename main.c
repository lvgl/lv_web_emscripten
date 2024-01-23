
/**
 * @file main
 *
 */

/*********************
 *      INCLUDES
 *********************/
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#define SDL_MAIN_HANDLED        /*To fix SDL's "undefined reference to WinMain" issue*/
#include <SDL2/SDL.h>
#include <emscripten.h>
#include "lvgl/lvgl.h"
#include "lvgl/demos/lv_demos.h"
#include "examplelist.h"

/*********************
 *      DEFINES
 *********************/

/*On OSX SDL needs different handling*/
#if defined(__APPLE__) && defined(TARGET_OS_MAC)
# if __APPLE__ && TARGET_OS_MAC
#define SDL_APPLE
# endif
#endif

/**********************
 *      TYPEDEFS
 **********************/

/**********************
 *  STATIC PROTOTYPES
 **********************/
static void hal_init(void);
static int tick_thread(void * data);
static void memory_monitor(lv_timer_t * param);

/**********************
 *  STATIC VARIABLES
 **********************/
int monitor_hor_res, monitor_ver_res;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void do_loop(void *arg);

/* Allows disabling CHOSEN_DEMO */
static void lv_example_noop(void) {
}



int add_int(int a, int b) {
	return a + b;
}

int main(int argc, char ** argv)
{
	printf("Main started\n");

    monitor_hor_res = 800;
    monitor_ver_res = 480;

    /*Initialize LittlevGL*/
    lv_init();

    /*Initialize the HAL (display, input devices, tick) for LittlevGL*/
    hal_init();

//    lv_demo_widgets();

	lv_label_create(lv_screen_active());

    emscripten_set_main_loop_arg(do_loop, NULL, -1, true);
}

void do_loop(void *arg)
{
    /* Periodically call the lv_task handler.
     * It could be done in a timer interrupt or an OS task too.*/
    lv_task_handler();
}

/**********************
 *   STATIC FUNCTIONS
 **********************/


/**
 * Initialize the Hardware Abstraction Layer (HAL) for the Littlev graphics library
 */
static void hal_init(void)
{
    lv_display_t * disp = lv_sdl_window_create(monitor_hor_res, monitor_ver_res);

    lv_group_t * g = lv_group_create();
    lv_group_set_default(g);

    lv_sdl_mouse_create();
    lv_sdl_mousewheel_create();
    lv_sdl_keyboard_create();
 
    lv_indev_t * mouse = lv_sdl_mouse_create();
    lv_indev_set_group(mouse, lv_group_get_default());
    
    lv_indev_t * mousewheel = lv_sdl_mousewheel_create();
    lv_indev_set_group(mousewheel, lv_group_get_default());

    lv_indev_t * keyboard = lv_sdl_keyboard_create();
    lv_indev_set_group(keyboard, lv_group_get_default());    
}
