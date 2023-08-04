# docker pygame


## Installed Package

- python 3.11
- pygame
- moderngl PyGLM numba

## Before build local image

https://download.nvidia.com/XFree86/Linux-x86_64/515.48.07/NVIDIA-Linux-x86_64-515.48.07.run

pygame in docker require nvidia driver to work 

in Dockerfile

```docker
RUN apt-get install -y kmod 
RUN sh NVIDIA-Linux-x86_64-515.48.07.run   --accept-license --ui=none --no-kernel-module --no-questions
```

## NOTE

### enable xquartz GLX

https://github.com/XQuartz/XQuartz/issues/144

```bash
defaults write org.xquartz.X11  enable_iglx -bool YES
```

```bash
defaults read org.xquartz.X11  enable_iglx
```

### Misc


https://saturncloud.io/blog/can-i-use-my-gpu-from-a-docker-container-on-a-macbook-pro-amd-radeon-gpu/

maybe + mesa-utils xserver-xorg-video-all


```
glxinfo | grep ":" 

name of display: 10.192.89.36:0
display: 10.192.89.36:0  screen: 0
direct rendering: Yes
server glx vendor string: SGI
server glx version string: 1.4
server glx extensions:
client glx vendor string: Mesa Project and SGI
client glx version string: 1.4
client glx extensions:
GLX version: 1.4
GLX extensions:
OpenGL vendor string: ATI Technologies Inc.
OpenGL renderer string: AMD Radeon Pro 560X OpenGL Engine
OpenGL version string: 2.1 ATI-4.12.7   # <== GL version supported
OpenGL shading language version string: 1.20
OpenGL extensions:
160 GLXFBConfigs:
```

To get full OpenGL support, you’ll want to use “direct” rendering. Direct rendering supports the latest OpenGL versions, while Indirect rendering fell out of vogue years ago and does not.


OpenGL with X11 can run in two different modes: direct rendering and indirect rendering. The difference between them is that indirect rendering uses the GLX protocol to relay the OpenGL commands from the program to the hardware, which limits OpenGL capabilities to OpenGL 1.4.

When using OpenGL over X11 with SSH, quite often direct rendering is not available and you have to use indirect rendering. 

----

Platform Issue (MacOSX): When MacOSX 10.7 introduced support for OpenGL beyond 2.1, they also introduced the core/compatibility dichotomy. However, they did not introduce support for the compatibility profile itself. Instead, MacOSX gives you a choice: core profile for versions 3.2 or higher, or just version 2.1. There is no way to get access to features after 2.1 and still access the Fixed Function Pipeline.


OpenGL > 3.0 has a core version number (in your case 4.1) and a compatibility version number (pegged at 3.0). The trick is to convince Minecraft to use the right version number. On one of my computers (running Devuan Linux Ascii - similar to Debian 9) I found you can insert the following lines in your launcher script, before invoking Java:

export MESA_GL_VERSION_OVERRIDE=<yourCoreVersionNumberHere> # i.e. 4.1
export MESA_GLSL_VERSION_OVERRIDE=<yourCoreVersionNumberWithoutTheDecimalPaddedWithZeros> # i.e. 410

However, this is not a guaranteed fix, because I tried the same thing on my laptop and Minecraft threw a fatal error.

---

https://www.scm.com/doc/Installation/Remote_GUI.html


