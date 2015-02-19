#!/bin/bash

set -e
#for i in armeabi x86 armeabi-v7a;do
for i in armeabi x86 armeabi-v7a;do
	rm -f bin
	mkdir -p bin-"$i"
	ln -s bin-"$i" bin
	bash build-android.sh "$i"
	rm -f bin
done
