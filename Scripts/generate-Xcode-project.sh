#!/bin/sh
SCRIPT_DIR=$(cd $(dirname $0); pwd)
cd $SCRIPT_DIR
BUILD_DIR=../build
if [ ! -d $BUILD_DIR ]; then
  mkdir $BUILD_DIR
fi
cd $BUILD_DIR
echo "pwd=$PWD"

cmake -H.. -BXcode -G Xcode \
    -DBUILD_EXAMPLES=OFF \
    -DBUILD_TESTING=OFF \
    -DCMAKE_SYSTEM_NAME=iOS \
    -DWITH_OGG=OFF \
    -DWITH_ASM=OFF

