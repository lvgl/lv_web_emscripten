# Emscripten port

**LittlevGL ported to Emscripten to be converted to JavaScript**

The result looks like this https://littlevgl.com/live-demo

**This branch is for LVGL's C online C simulator (under development).**
- `make lib` creates `proj.bc` a compiled and linked lvgl code
- `make build` build `sim.c` and links it with proj.bc
- The result `sim.js` and `proj.wasm` can be used in a html file as usual

# How to get started

## Install SDL

Downlad [SDL](https://www.libsdl.org/) (a graphics library to ope na window and handle the mouse). On Linux:
1. Find the current version of SDL2: `apt-cache search libsdl2 (e.g. libsdl2-2.0-0)`
2. Install SDL2: `sudo apt-get install libsdl2-2.0-0` (replace with the found version)
3. Install SDL2 development package: `sudo apt-get install libsdl2-dev`
4. If build essentials are not installed yet: `sudo apt-get install build-essential`


## Install Emscripten SDK
Download the [Emscripten SDK](https://kripken.github.io/emscripten-site/) and make sure it is in your PATH.

1. `git clone https://github.com/emscripten-core/emsdk.git`
2. `cd <path-to-emsdk>`
3. `git pull`
4. `./emsdk install latest`
5. `./emsdk activate latest`
6. `source ./emsdk_env.sh`

More info here: https://kripken.github.io/emscripten-site/docs/getting_started/downloads.html

## Get the Emscripten-LittlevGL project
1. Be sure you ran `. <path-to-emsdk>/emsdk_env.sh` to add EMSDK to `PATH`
2. In any directoy: `git clone --recursive https://github.com/littlevgl/emscripten.git`
3. `cd <path-to-emscripten>` 
4. `make` or `emconfigure cmake -DCMAKE_TOOLCHAIN_FILE="${EMSDK}/upstream/emscripten/cmake/Modules/Platform/Emscripten.cmake" -S . -B build && cmake --build build -j $(nproc)`
5. A file called `lvgl.html` or `build/lvgl.html` will be generated. Run this in your browser.


### Known issue with Google Chrome browser
Chrome can't open the generated html file offline. It works if you copy the files to a server. Use Firefox or other browser for offline testing.

### Known issue with Firefox
Firefox can't open the generated html file offline unless you go to `about:config` and change `privacy.file_unique_origin` to `false`.
