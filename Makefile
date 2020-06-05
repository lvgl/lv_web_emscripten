CC = emcc

TARGET := lvgl.html

SRCS += $(shell find -L lvgl -name \*.c)

SRCS += lv_drivers/display/monitor.c lv_drivers/indev/mouse.c
SRCS += lv_drivers/indev/keyboard.c
SRCS += lv_drivers/indev/mousewheel.c

# (v5.3) SRCS += lv_drivers/indev/encoder.c

SRCS += mouse_cursor_icon.c
SRCS_LIB += mouse_cursor_icon.c

# If V=1 you will see full compiler arguments
ifeq ($(V),)
Q := @
else
Q :=
endif


CSRCS := $(SRCS)
CSRCS += main.c 
COBJS := $(CSRCS:.c=.o)

CSRCS_LIB := $(SRCS)
COBJS_LIB := $(CSRCS_LIB:.c=.o)

# Try this if you experience problems:
# CFLAGS += -s EMULATE_FUNCTION_POINTER_CASTS=1

CFLAGS += -DLV_CONF_INCLUDE_SIMPLE=1 -I. -Ilvgl -O3

# debug flags
# CFLAGS += -g4 --source-map-base http://127.0.0.1:8080/ -frtti -s DEMANGLE_SUPPORT=1

%.o: %.c Makefile
	@echo " CC " $<
	$(Q)$(CC) -c $(CFLAGS) -s USE_SDL=2 -o $@ $<

all: $(TARGET)

lib: $(COBJS_LIB)
	@echo " LINK " $@
	$(Q)$(CC) $(CFLAGS) -s USE_SDL=2 -o proj.bc $(COBJS_LIB)
	

$(TARGET): $(COBJS) lvgl_shell.html
	@echo " LINK " $@
	$(Q)$(CC) $(CFLAGS) -s USE_SDL=2 -o lvgl.html --shell-file lvgl_shell.html $(COBJS)

clean:
	@rm -f lvgl.html lvgl.js lvgl.wasm lvgl.wasm.* lvgl.wast lvgl.asm.js $(COBJS)
