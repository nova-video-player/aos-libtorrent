#!/bin/bash

set -e

#found=1
#for i in x86 armeabi-v7a;do
#	[ ! -f bin-$i/gcc-androidR8e/release/boost-source/link-static/threading-multi/libtorrent.a ] && found=0
#done
#
#[ "$found" == 1 ] && exit 0

for i in x86 x86_64 armeabi-v7a arm64-v8a ;do
	rm -f bin
	mkdir -p bin-"$i"
	ln -s bin-"$i" bin
	bash build-android.sh "$i"
	rm -f bin
done
