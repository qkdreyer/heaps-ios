#!/bin/sh
BUILD_DIR=$PWD/build/src
IN=${1:-compile.hxml}
OUT=${2:-main.c}
PAK=${3:-pak.hl}

rm -rf $BUILD_DIR
cd src
haxelib install --always $IN || exit 1
haxe -hl $BUILD_DIR/$OUT -L heaps -L hlsdl $IN || exit 2
haxe -hl $BUILD_DIR/$PAK -L heaps -main hxd.fmt.pak.Build || exit 3
hl $BUILD_DIR/$PAK -out $BUILD_DIR/res || exit 4
