#!/bin/sh
# ---
# crosstool-NG
#  see https://github.com/crosstool-ng/crosstool-ng.git
# ---

BUILD_DEPS="\
git \
autoconf \
automake \
build-base \
gperf \
bison \
flex \
texinfo \
libtool \
ncurses-dev \
wget \
gawk \
libc-dev \
help2man \
unzip"

# update repo index
apk update 

# install build deps
apk add $BUILD_DEPS

# build 
cd /root

git clone -b 1.22 https://github.com/crosstool-ng/crosstool-ng.git 
cd crosstool-ng
./bootstrap
./configure
make
make install

# clean up
rm -rf ../crosstool-ng/ 

