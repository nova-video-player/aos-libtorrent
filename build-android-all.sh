#!/bin/bash

set -e

for i in x86 x86_64 armeabi-v7a arm64-v8a ;do
	bash build-android.sh "$i"
done
