
/**
 * @file main
 *
 */

/*********************
 *      INCLUDES
 *********************/
#include <stdlib.h>
#include <unistd.h>
#define SDL_MAIN_HANDLED        /*To fix SDL's "undefined reference to WinMain" issue*/
#include <SDL2/SDL.h>
#include <emscripten.h>
#include "lvgl/lvgl.h"
#include "lv_drivers/display/monitor.h"
#include "lv_drivers/indev/mouse.h"
#include "lv_drivers/indev/mousewheel.h"
#include "lv_drivers/indev/keyboard.h"

#include "lv_examples/lv_examples.h"

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
static void memory_monitor(lv_task_t * param);

/**********************
 *  STATIC VARIABLES
 **********************/
static lv_disp_t  * disp1;

/**********************
 *      MACROS
 **********************/

/**********************
 *   GLOBAL FUNCTIONS
 **********************/
void do_loop(void *arg);

int main(int argc, char ** argv)
{
    (void) argc;    /*Unused*/
    (void) argv;    /*Unused*/

    /*Initialize LittlevGL*/
    lv_init();

    /*Initialize the HAL (display, input devices, tick) for LittlevGL*/
    hal_init();

    /*Load a demo*/
    CHOSEN_DEMO();

    emscripten_set_main_loop_arg(do_loop, NULL, -1, true);
}

void do_loop(void *arg)
{
    /* Periodically call the lv_task handler.
     * It could be done in a timer interrupt or an OS task too.*/
    lv_task_handler();

    SDL_Event event;
    
    while(SDL_PollEvent(&event)) {
        #if USE_MOUSE != 0
            mouse_handler(&event);
        #endif

        #if USE_KEYBOARD
            keyboard_handler(&event);
        #endif

#if USE_MOUSEWHEEL != 0
            mousewheel_handler(&event);
#endif
    }

}

/**********************
 *   STATIC FUNCTIONS
 **********************/


/**
 * Initialize the Hardware Abstraction Layer (HAL) for the Littlev graphics library
 */
static void hal_init(void)
{
   /* Use the 'monitor' driver which creates window on PC's monitor to simulate a display*/
    monitor_init();

    /*Create a display buffer*/
    static lv_disp_buf_t disp_buf1;
    static lv_color_t buf1_1[LV_HOR_RES_MAX*LV_VER_RES_MAX];
    lv_disp_buf_init(&disp_buf1, buf1_1, NULL, LV_HOR_RES_MAX*LV_VER_RES_MAX);

    /*Create a display*/
    lv_disp_drv_t disp_drv;
    lv_disp_drv_init(&disp_drv);            /*Basic initialization*/
    disp_drv.buffer = &disp_buf1;
    disp_drv.flush_cb = monitor_flush;    /*Used when `LV_VDB_SIZE != 0` in lv_conf.h (buffered drawing)*/
    disp_drv.hor_res = LV_HOR_RES_MAX;
    disp_drv.ver_res = LV_VER_RES_MAX;
    disp1 = lv_disp_drv_register(&disp_drv);

    /* Add the mouse as input device
     * Use the 'mouse' driver which reads the PC's mouse*/
    mouse_init();
    lv_indev_drv_t indev_drv;
    lv_indev_drv_init(&indev_drv);          /*Basic initialization*/
    indev_drv.type = LV_INDEV_TYPE_POINTER;
    indev_drv.read_cb = mouse_read;         /*This function will be called periodically (by the library) to get the mouse position and state*/
    lv_indev_t * mouse_indev = lv_indev_drv_register(&indev_drv);

#ifndef __EMSCRIPTEN__ /* Using a cursor with Emscripten makes no sense */
    /*Set a cursor for the mouse*/
    LV_IMG_DECLARE(mouse_cursor_icon);                          /*Declare the image file.*/
    lv_obj_t * cursor_obj =  lv_img_create(lv_disp_get_scr_act(NULL), NULL); /*Create an image object for the cursor */
    lv_img_set_src(cursor_obj, &mouse_cursor_icon);             /*Set the image source*/
    lv_indev_set_cursor(mouse_indev, cursor_obj);               /*Connect the image  object to the driver*/
#endif

    /* Optional:
     * Create a memory monitor task which prints the memory usage in periodically.*/
    lv_task_create(memory_monitor, 3000, LV_TASK_PRIO_MID, NULL);
}

/**
 * Print the memory usage periodically
 * @param param
 */
static void memory_monitor(lv_task_t * param)
{
    (void) param; /*Unused*/

    lv_mem_monitor_t mon;
    lv_mem_monitor(&mon);
    printf("used: %6d (%3d %%), frag: %3d %%, biggest free: %6d\n", (int)mon.total_size - mon.free_size,
           mon.used_pct,
           mon.frag_pct,
           (int)mon.free_biggest_size);
}
