#!/bin/sh
OUT=build/src

cd src
haxelib install compile.hxml --always || exit 1
haxe -hl $OUT/main.c compile.hxml -lib hlsdl || exit 2
haxe -L heaps -main hxd.fmt.pak.Build -hl $OUT/pak.hl || exit 3
hl $OUT/pak.hl -out $OUT/res && rm $OUT/pak.hl || exit 4
