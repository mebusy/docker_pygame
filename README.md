# docker pygame


## Installed Package

- python 3.11
- pygame
- moderngl PyGLM numba



https://saturncloud.io/blog/can-i-use-my-gpu-from-a-docker-container-on-a-macbook-pro-amd-radeon-gpu/

maybe + mesa-utils xserver-xorg-video-all


defaults read org.xquartz.X11  enable_iglx




https://github.com/XQuartz/XQuartz/issues/144


Nvidia Driver

apt-get install -y   kmod 

https://download.nvidia.com/XFree86/Linux-x86_64/515.48.07/NVIDIA-Linux-x86_64-515.48.07.run

sh NVIDIA-Linux-x86_64-515.48.07.run   --accept-license --ui=none --no-kernel-module --no-questions
