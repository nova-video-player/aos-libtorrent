#!/bin/bash

set -e
#Needed variables:
# - $android_ndk
# - $REPO_TOP_DIR
# - $1 = arch

export BOOST_VERSION=1_69_0
export PlatformOS=linux
export HOST=x86_64

export ARCH=$1

export AndroidNDKRoot=$android_ndk

AndroidBinariesPath=""
#toolchains/llvm/prebuilt/linux-x86_64/bin
for i in aarch64-linux-android arm-linux-androideabi x86;do
  AndroidBinariesPath=$AndroidBinariesPath:$AndroidNDKRoot/toolchains/llvm/prebuilt/${PlatformOS}-"${HOST}/bin/"
done
export PATH=$AndroidBinariesPath:$PATH
export BOOST_ROOT=$REPO_TOP_DIR/native/boost/boost_$BOOST_VERSION-$ARCH

#cp $BOOST_ROOT/../configs/user-config-boost-$BOOST_VERSION-${ARCH}.jam user-config.jam
#cp $BOOST_ROOT/../configs/user-config-boost-$BOOST_VERSION-${ARCH}.jam $BOOST_ROOT/tools/build/v2/user-config.jam
export BOOST_BUILD_PATH=$PWD

os=linux
[ `uname` == "Darwin" ] && os=macosx

$BOOST_ROOT/tools/build/src/engine/bin.${os}x86_64/b2 toolset=clang-android link=static runtime-link=static release -j4
