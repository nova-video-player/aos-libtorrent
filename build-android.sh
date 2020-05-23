#!/bin/bash

set -e
#Needed variables:
# - $android_ndk
# - $REPO_TOP_DIR
# - $1 = arch

export BOOST_VERSION=1_72_0
export ARCH=$1

export BOOST_ROOT=$REPO_TOP_DIR/native/boost/boost_$BOOST_VERSION
BOOST=boost_$BOOST_VERSION

export BOOST_BUILD_PATH=$REPO_TOP_DIR/native/boost/boost_$BOOST_VERSION-${ARCH}

$BOOST_ROOT/b2 \
    --build-dir=../boost/${BOOST}-${ARCH} \
    --stagedir=../boost/${BOOST}-${ARCH}/stage \
    toolset=clang-android link=static runtime-link=static target-os=android release -j32
