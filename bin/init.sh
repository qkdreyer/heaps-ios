#!/bin/sh

git submodule update --remote --depth 1 --init --recursive
git update-index --assume-unchanged Configuration/Config.xcconfig

brew install haxe
brew bundle install --file deps/hashlink/Brewfile --no-lock

haxelib setup /usr/local/lib/haxe/lib
haxelib install hlsdl
haxelib install hlopenal
haxelib install hashlink
haxelib install format

echo '.gitignore\nbuild' > deps/SDL/.gitignore
