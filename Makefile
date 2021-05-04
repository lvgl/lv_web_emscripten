SHELL := /bin/bash
CC = emcc

CCACHE ?=

ifneq ($(CCACHE),)
CC:= $(CCACHE) $(CC)
endif

TARGET := build/index.html

SRCS += $(shell find -L lvgl -name \*.c)
ifneq (,$(wildcard ./lv_examples))
SRCS += $(shell find -L lv_examples -name \*.c)
endif

SRCS += lv_drivers/display/monitor.c lv_drivers/indev/mouse.c
SRCS += lv_drivers/indev/keyboard.c
SRCS += lv_drivers/indev/mousewheel.c

SRCS += main.c mouse_cursor_icon.c examplelist.c

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

CHOSEN_DEMO ?= lv_demo_widgets

CFLAGS += -DLV_CONF_INCLUDE_SIMPLE=1 -I. -Ilvgl -DCHOSEN_DEMO=$(CHOSEN_DEMO)

MAKEFILE_DEP ?= Makefile lv_conf.h lv_ex_conf.h lv_drv_conf.h


# debug flags
# CFLAGS += -g4 --source-map-base http://127.0.0.1:8080/ -frtti -s DEMANGLE_SUPPORT=1

.PHONY: build

all: $(TARGET)

main.o: build

%.o: %.c $(MAKEFILE_DEP)
	@echo " CC " $<
	$(Q)$(CC) -c $(CFLAGS) -O2 -s USE_SDL=2 -o $@ $<

$(TARGET): build $(COBJS) lvgl_shell.html
	@echo " LINK " $@
	$(Q)$(CC) $(CFLAGS) -O0 -s USE_SDL=2 -o $(TARGET) --shell-file lvgl_shell.html $(COBJS)
	$(Q)rm -f build/gitrev.js
ifneq ($(NO_GIT_HASH),1)
	$(Q)echo "window.git_hash = \"$(shell ./findtag.sh)\";" > build/gitrev.js
endif

clean:
	@rm -f $(TARGET) $(addprefix build/, lvgl.js lvgl.wasm lvgl.wasm.* lvgl.wast lvgl.asm.js gitrev.js) $(COBJS)

build:
	$(Q)mkdir -p build

