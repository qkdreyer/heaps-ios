#!/bin/sh

pushd deps

echo "Linking Haxelib Dependencies"
haxelib dev heaps "heaps"

echo "Patching Hashlink SDL2 Header Path"
pushd hashlink
curl https://gist.githubusercontent.com/qkdreyer/1a22b10fe4064554f724bf5a400fe470/raw/8524ef768e79c1668eb5cea8fbf7216ca816f5b9/gistfile1.txt | git apply
popd
