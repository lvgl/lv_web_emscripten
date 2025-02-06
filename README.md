# Emscripten port

**LVGL ported to Emscripten to be converted to JavaScript**

The result looks like this: [https://lvgl.io/demos](https://lvgl.io/demos)

# How to get started

## Install SDL

Download [SDL](https://www.libsdl.org/) (a graphics library to open a window and handle the mouse). On Linux:

1. Find the current version of SDL2: `apt-cache search libsdl2` (e.g., `libsdl2-2.0-0`)
1. Install SDL2: `sudo apt-get install libsdl2-2.0-0` (replace with the found version)
1. Install the SDL2 development package: `sudo apt-get install libsdl2-dev`
1. If build essentials are not installed yet: `sudo apt-get install build-essential`

---

## Install Emscripten SDK

Download the [Emscripten SDK](https://kripken.github.io/emscripten-site/) and make sure it is in your `PATH`.

1. `git clone https://github.com/emscripten-core/emsdk.git`
1. `cd emsdk`
1. `git pull`
1. `./emsdk install latest`
1. `./emsdk activate latest`
1. `source ./emsdk_env.sh`

More info here: [Emscripten Downloads](https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html)

---

## Get the Emscripten-LVGL project

1. Be sure you ran `. <path-to-emsdk>/emsdk_env.sh` to add EMSDK to `PATH`
1. In any directory: `git clone --recursive https://github.com/lvgl/lv_web_emscripten.git`
1. `cd lv_web_emscripten`
1. `mkdir cmbuild`
1. `cd cmbuild`
1. `emcmake cmake ..`
1. `emmake make -j4`
1. A file called `index.html` will be generated. Open this in your browser

---

### Build options (environment variables)

* `LVGL_CHOSEN_DEMO` can be set to the desired demo name so that you don't need to change any C files. This is useful to compile many demos in bulk using a script.

Example: 
```bash
emcmake cmake .. -DLVGL_CHOSEN_DEMO=lv_demo_widgets
```

### Known issue with Google Chrome browser
Chrome might not be able to open the generated HTML file offline. It works if you copy the files to a server. Use Firefox or other browser for offline testing if needed.

### Known issue with Firefox
Firefox might not be able to open the generated HTML file offline unless you go to `about:config` and change `privacy.file_unique_origin` to `false`.
