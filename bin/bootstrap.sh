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
curl -s curl -s https://github.com/HaxeFoundation/hashlink/commit/41f0667e24b1e0991a8fb4d1bc00e8b602822e58.diff | git -C deps/hashlink apply | git -C deps/hashlink apply
