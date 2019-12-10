CC = emcc

TARGET := lvgl.html

SRCS += lvgl/src/lv_draw/lv_draw_line.c 
SRCS += lvgl/src/lv_draw/lv_img_decoder.c 
SRCS += lvgl/src/lv_draw/lv_draw_img.c lvgl/src/lv_draw/lv_draw_arc.c
SRCS += lvgl/src/lv_draw/lv_draw_rect.c lvgl/src/lv_draw/lv_draw_triangle.c
SRCS += lvgl/src/lv_draw/lv_draw.c lvgl/src/lv_draw/lv_draw_label.c
SRCS += lvgl/src/lv_draw/lv_draw_basic.c lvgl/src/lv_draw/lv_img_cache.c

SRCS += lvgl/src/lv_font/lv_font.c          lvgl/src/lv_font/lv_font_roboto_12.c  lvgl/src/lv_font/lv_font_roboto_22.c
SRCS += lvgl/src/lv_font/lv_font_fmt_txt.c  lvgl/src/lv_font/lv_font_roboto_16.c  lvgl/src/lv_font/lv_font_roboto_28.c

SRCS += lvgl/src/lv_objx/lv_cont.c lvgl/src/lv_objx/lv_img.c lvgl/src/lv_objx/lv_kb.c

SRCS += lvgl/src/lv_objx/lv_roller.c lvgl/src/lv_objx/lv_cb.c lvgl/src/lv_objx/lv_led.c
SRCS += lvgl/src/lv_objx/lv_calendar.c lvgl/src/lv_objx/lv_gauge.c lvgl/src/lv_objx/lv_page.c
SRCS += lvgl/src/lv_objx/lv_list.c lvgl/src/lv_objx/lv_bar.c lvgl/src/lv_objx/lv_tabview.c
SRCS += lvgl/src/lv_objx/lv_mbox.c lvgl/src/lv_objx/lv_objx_templ.c lvgl/src/lv_objx/lv_sw.c
SRCS += lvgl/src/lv_objx/lv_label.c lvgl/src/lv_objx/lv_slider.c lvgl/src/lv_objx/lv_ddlist.c
SRCS += lvgl/src/lv_objx/lv_imgbtn.c lvgl/src/lv_objx/lv_line.c lvgl/src/lv_objx/lv_chart.c
SRCS += lvgl/src/lv_objx/lv_btnm.c lvgl/src/lv_objx/lv_arc.c lvgl/src/lv_objx/lv_preload.c
SRCS += lvgl/src/lv_objx/lv_win.c lvgl/src/lv_objx/lv_lmeter.c lvgl/src/lv_objx/lv_btn.c
SRCS += lvgl/src/lv_objx/lv_ta.c lvgl/src/lv_misc/lv_log.c lvgl/src/lv_misc/lv_fs.c
SRCS += lvgl/src/lv_misc/lv_task.c lvgl/src/lv_misc/lv_circ.c lvgl/src/lv_misc/lv_anim.c
SRCS += lvgl/src/lv_misc/lv_color.c lvgl/src/lv_misc/lv_txt.c lvgl/src/lv_misc/lv_math.c
SRCS += lvgl/src/lv_misc/lv_mem.c

SRCS += lvgl/src/lv_misc/lv_ll.c lvgl/src/lv_misc/lv_area.c lvgl/src/lv_misc/lv_templ.c lvgl/src/lv_misc/lv_utils.c
SRCS += lvgl/src/lv_hal/lv_hal_tick.c lvgl/src/lv_hal/lv_hal_indev.c lvgl/src/lv_hal/lv_hal_disp.c
SRCS += lvgl/src/lv_core/lv_disp.c lvgl/src/lv_core/lv_debug.c
SRCS += lvgl/src/lv_themes/lv_theme_mono.c lvgl/src/lv_themes/lv_theme_templ.c
SRCS += lvgl/src/lv_themes/lv_theme_material.c lvgl/src/lv_themes/lv_theme.c
SRCS += lvgl/src/lv_themes/lv_theme_night.c lvgl/src/lv_themes/lv_theme_zen.c
SRCS += lvgl/src/lv_themes/lv_theme_alien.c lvgl/src/lv_themes/lv_theme_default.c
SRCS += lvgl/src/lv_themes/lv_theme_nemo.c
SRCS += lvgl/src/lv_core/lv_group.c lvgl/src/lv_core/lv_style.c lvgl/src/lv_core/lv_indev.c
SRCS += lvgl/src/lv_core/lv_obj.c lvgl/src/lv_core/lv_refr.c
SRCS += lv_examples/lv_tests/lv_test_theme/lv_test_theme_1.c
SRCS += lv_examples/lv_tests/lv_test_theme/lv_test_theme_2.c
#SRCS += lv_examples/lv_tests/lv_test_stress/lv_test_stress.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_img/img_flower_icon.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_arc/lv_test_arc.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_table/lv_test_table.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/imgbtn_img_1.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_imgbtn/imgbtn_img_2.c
SRCS += lv_examples/lv_tests/lv_test_group/lv_test_group.c
SRCS += lv_examples/lv_apps/demo/demo.c lv_examples/lv_apps/demo/img_bubble_pattern.c
SRCS += lvgl/src/lv_misc/lv_gc.c
SRCS += lvgl/src/lv_objx/lv_table.c
SRCS += lvgl/src/lv_objx/lv_spinbox.c
SRCS += lvgl/src/lv_objx/lv_canvas.c
SRCS += lvgl/src/lv_objx/lv_tileview.c


SRCS += lv_drivers/display/monitor.c lv_drivers/indev/mouse.c
SRCS += lv_drivers/display/monitor.c lv_drivers/indev/keyboard.c
SRCS += lv_drivers/display/monitor.c lv_drivers/indev/mousewheel.c

# (v5.3) SRCS += lv_drivers/indev/encoder.c

SRCS += main.c mouse_cursor_icon.c

# If V=1 you will see full compiler arguments
ifeq ($(V),)
Q := @
else
Q :=
endif

CSRCS := $(SRCS)

COBJS := $(CSRCS:.c=.o)

# Try this if you experience problems:
# CFLAGS += -s EMULATE_FUNCTION_POINTER_CASTS=1

CFLAGS += -DLV_CONF_INCLUDE_SIMPLE=1 -I. -Ilvgl

%.o: %.c Makefile
	@echo " CC " $<
	$(Q)$(CC) -c $(CFLAGS) -O2 -s USE_SDL=2 -o $@ $<

all: $(TARGET)

$(TARGET): $(COBJS) lvgl_shell.html
	@echo " LINK " $@
	$(Q)$(CC) $(CFLAGS) -O2 -s USE_SDL=2 -o lvgl.html --shell-file lvgl_shell.html $(COBJS)

clean:
	@rm -f lvgl.html lvgl.js lvgl.wasm lvgl.wasm.* lvgl.wast lvgl.asm.js $(COBJS)
