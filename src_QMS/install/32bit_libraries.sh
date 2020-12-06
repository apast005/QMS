#!/bin/bash

sudo dpkg --add-architecture i386
sudo apt-get update
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386
sudo apt-get install lib32z1 lib32ncurses5 lib32bz2-1.0
sudo apt-get install build-essential
sudo apt-get install gcc-multilib g++-multilib lib32stdc++6 lib32gcc1 \
expat:i386 fontconfig:i386 libfreetype6:i386 libexpat1:i386 libgtk-3-0:i386 \
libcanberra0:i386 libice6:i386 libsm6:i386 zlib1g:i386 libx11-6:i386 \
libxau6:i386 libxdmcp6:i386 libxext6:i386 libxft2:i386 libxrender1:i386 \
libxt6:i386 libxtst6:i386
