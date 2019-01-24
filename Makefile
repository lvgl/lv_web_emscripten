CC = emcc

TARGET := lvgl.html

SRCS += lvgl/lv_draw/lv_draw_line.c lvgl/lv_draw/lv_draw_rbasic.c
SRCS += lvgl/lv_draw/lv_draw_img.c lvgl/lv_draw/lv_draw_arc.c
SRCS += lvgl/lv_draw/lv_draw_rect.c lvgl/lv_draw/lv_draw_triangle.c
SRCS += lvgl/lv_draw/lv_draw.c lvgl/lv_draw/lv_draw_label.c
SRCS += lvgl/lv_draw/lv_draw_vbasic.c lvgl/lv_fonts/lv_font_builtin.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_20.c lvgl/lv_fonts/lv_font_dejavu_40.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_30_latin_sup.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_10_cyrillic.c lvgl/lv_fonts/lv_font_monospace_8.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_10_latin_sup.c lvgl/lv_fonts/lv_font_symbol_40.c
SRCS += lvgl/lv_fonts/lv_font_symbol_10.c lvgl/lv_fonts/lv_font_dejavu_10.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_40_cyrillic.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_20_cyrillic.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_30_cyrillic.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_20_latin_sup.c
SRCS += lvgl/lv_fonts/lv_font_dejavu_40_latin_sup.c lvgl/lv_fonts/lv_font_symbol_30.c
SRCS += lvgl/lv_fonts/lv_font_symbol_20.c lvgl/lv_fonts/lv_font_dejavu_30.c
SRCS += lvgl/lv_objx/lv_cont.c lvgl/lv_objx/lv_img.c lvgl/lv_objx/lv_kb.c
SRCS += lvgl/lv_objx/lv_table.c
SRCS += lvgl/lv_objx/lv_roller.c lvgl/lv_objx/lv_cb.c lvgl/lv_objx/lv_led.c
SRCS += lvgl/lv_objx/lv_calendar.c lvgl/lv_objx/lv_gauge.c lvgl/lv_objx/lv_page.c
SRCS += lvgl/lv_objx/lv_list.c lvgl/lv_objx/lv_bar.c lvgl/lv_objx/lv_tabview.c
SRCS += lvgl/lv_objx/lv_mbox.c lvgl/lv_objx/lv_objx_templ.c lvgl/lv_objx/lv_sw.c
SRCS += lvgl/lv_objx/lv_label.c lvgl/lv_objx/lv_slider.c lvgl/lv_objx/lv_ddlist.c
SRCS += lvgl/lv_objx/lv_imgbtn.c lvgl/lv_objx/lv_line.c lvgl/lv_objx/lv_chart.c
SRCS += lvgl/lv_objx/lv_btnm.c lvgl/lv_objx/lv_arc.c lvgl/lv_objx/lv_preload.c
SRCS += lvgl/lv_objx/lv_win.c lvgl/lv_objx/lv_lmeter.c lvgl/lv_objx/lv_btn.c
SRCS += lvgl/lv_objx/lv_ta.c lvgl/lv_misc/lv_log.c lvgl/lv_misc/lv_fs.c
SRCS += lvgl/lv_misc/lv_task.c lvgl/lv_misc/lv_circ.c lvgl/lv_misc/lv_anim.c
SRCS += lvgl/lv_misc/lv_color.c lvgl/lv_misc/lv_txt.c lvgl/lv_misc/lv_math.c
SRCS += lvgl/lv_misc/lv_mem.c lvgl/lv_misc/lv_font.c lvgl/lv_misc/lv_ll.c
SRCS += lvgl/lv_misc/lv_area.c lvgl/lv_misc/lv_templ.c lvgl/lv_misc/lv_ufs.c
SRCS += lvgl/lv_misc/lv_area.c lvgl/lv_misc/lv_templ.c lvgl/lv_misc/lv_gc.c
SRCS += lvgl/lv_hal/lv_hal_tick.c lvgl/lv_hal/lv_hal_indev.c lvgl/lv_hal/lv_hal_disp.c
SRCS += lvgl/lv_themes/lv_theme_mono.c lvgl/lv_themes/lv_theme_templ.c
SRCS += lvgl/lv_themes/lv_theme_material.c lvgl/lv_themes/lv_theme.c
SRCS += lvgl/lv_themes/lv_theme_night.c lvgl/lv_themes/lv_theme_zen.c
SRCS += lvgl/lv_themes/lv_theme_alien.c lvgl/lv_themes/lv_theme_default.c
SRCS += lvgl/lv_core/lv_group.c lvgl/lv_core/lv_style.c lvgl/lv_core/lv_indev.c
SRCS += lvgl/lv_core/lv_vdb.c lvgl/lv_core/lv_obj.c lvgl/lv_core/lv_refr.c
SRCS += lv_examples/lv_tests/lv_test_theme/lv_test_theme_1.c
SRCS += lv_examples/lv_tests/lv_test_theme/lv_test_theme_2.c
SRCS += lv_examples/lv_tests/lv_test_stress/lv_test_stress.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_img/img_flower_icon.c
SRCS += lv_examples/lv_tests/lv_test_objx/lv_test_arc/lv_test_arc.c

SRCS += lv_examples/lv_apps/demo/demo.c
SRCS += lv_examples/lv_apps/demo/img_bubble_pattern.c

SRCS += lv_drivers/display/monitor.c lv_drivers/indev/mouse.c

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
