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




