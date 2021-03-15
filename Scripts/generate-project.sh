#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
BUILD_DIR=../build
if [ ! -d $BUILD_DIR ]; then
  mkdir $BUILD_DIR
fi
cd $BUILD_DIR
echo "pwd=$PWD"

# cmake  -DCMAKE_TOOLCHAIN_FILE=./toolchain/iOS.cmake -DIOS_PLATFORM=SIMULATOR -H.. -BXcode -GXcode

cmake -H.. -BXcode -G Xcode \
    -DCMAKE_TOOLCHAIN_FILE=./toolchain/ios.toolchain.cmake \
    -DDEPLOYMENT_TARGET=11.0 \
    -DPLATFORM=OS64 \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -DWITH_OGG=OFF

