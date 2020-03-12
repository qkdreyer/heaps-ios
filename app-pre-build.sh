#!/bin/sh
OUT=$PWD/build/src
HXML=$PWD/.hxml

cd `dirname $(realpath $HXML)`
pwd

echo 'Installing libraries...'
haxelib install $HXML --always

echo 'Generating native code...'
haxe -hl $OUT/main.c $HXML || exit 1

echo 'Packing content...'
haxe -L heaps -main hxd.fmt.pak.Build -hl $OUT/pak.hl || exit 2
hl $OUT/pak.hl -out $OUT/res && rm $OUT/pak.hl || exit 3
sleep 1
