#!/bin/bash

set -e
#Needed variables:
# - $android_ndk
# - $REPO_TOP_DIR
# - $1 = arch

export BOOST_VERSION=1_55_0
export GCC_VERSION=4.9
export PlatformOS=linux
export HOST=x86_64

export ARCH=$1

export AndroidNDKRoot=$android_ndk

AndroidBinariesPath=""
for i in aarch64-linux-android arm-linux-androideabi x86 mipsel-linux-android mips64el-linux-android;do
  AndroidBinariesPath=$AndroidBinariesPath:$AndroidNDKRoot/toolchains/"$i-$GCC_VERSION"/prebuilt/${PlatformOS}-"${HOST}/bin/"
done
export PATH=$AndroidBinariesPath:$PATH
export BOOST_ROOT=$REPO_TOP_DIR/native/boost/boost_$BOOST_VERSION-$ARCH

cp $BOOST_ROOT/../configs/user-config-boost-$BOOST_VERSION-${ARCH}.jam user-config.jam
cp $BOOST_ROOT/../configs/user-config-boost-$BOOST_VERSION-${ARCH}.jam $BOOST_ROOT/tools/build/v2/user-config.jam
export BOOST_BUILD_PATH=$PWD
$BOOST_ROOT/tools/build/v2/engine/bin.linuxx86_64/b2 toolset=gcc-androidR8e boost=source release -j4
