FROM python:3.11-slim

MAINTAINER golden_slime@hotmail.com

RUN apt-get update -y && \
    apt-get install -y xvfb && \
    apt-get install -y xorg-dev libx11-dev libgl1-mesa-glx

# manually install python3-opengl dependencies
RUN apt-get install -y libgl1-mesa-dev libglu1-mesa libglu1-mesa-dev libglut-dev libglut3.12 libglvnd-core-dev libglvnd-dev libopengl-dev libopengl0  \
        python3-setuptools python3-dev python3-numpy
RUN apt-get install -y wget &&  wget --no-check-certificate http://deb.debian.org/debian/pool/main/p/pyopengl/python3-opengl_3.1.6+dfsg-3_all.deb
RUN dpkg -i ./python3-opengl_3.1.6+dfsg-3_all.deb 
RUN apt-get install -f

RUN apt-get install -y libsdl2-dev libsdl2-image-dev libsdl2-mixer-dev libsdl2-ttf-dev libfreetype6-dev libportmidi-dev libjpeg-dev 

RUN pip install pip --upgrade
RUN pip install pygame moderngl PyGLM numba
RUN pip install pyvirtualdisplay

# glxinfo, glxgears , etc...
RUN apt-get install -y mesa-utils

# install nvidia driver
RUN apt-get install -y kmod
COPY NVIDIA-Linux-x86_64-515.48.07.run /opt/NVIDIA-Linux-x86_64-515.48.07.run
RUN sh /opt/NVIDIA-Linux-x86_64-515.48.07.run  --accept-license --ui=none --no-kernel-module --no-questions
RUN rm /opt/NVIDIA-Linux-x86_64-515.48.07.run

# change work directory
WORKDIR /opt/work


# /bin/sh
# ENTRYPOINT ["python"]

