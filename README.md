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




