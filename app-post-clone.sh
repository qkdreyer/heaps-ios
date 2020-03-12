#!/bin/sh
pushd deps

echo 'Installing Haxe'
brew install haxe
echo 'Using haxe version '`haxe -version`
echo 'Setting up haxelib'
haxelib setup '/usr/local/lib/haxe/lib'
echo 'Using haxelib version '`haxelib version`

pushd hashlink

echo 'Fetching Hashlink Dependencies'
brew install libpng jpeg-turbo libvorbis sdl2 mbedtls openal-soft libuv

echo 'Installing Hashlink'
make all
make install
popd

echo 'Installing Haxelib Dependencies'
haxelib install hlsdl
haxelib install hlopenal
haxelib install hashlink
haxelib install format

echo 'Fetching Dependencies'
git submodule update --remote --depth 1 --init --recursive


echo '.gitignore\nbuild' > deps/SDL/.gitignore
