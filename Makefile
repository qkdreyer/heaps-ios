.PHONY: all init build install clean heaps-world

all: build install

init:
	git update-index --assume-unchanged Configuration/Config.xcconfig
	npm install -g ios-deploy
	brew install haxe
	brew bundle install --file deps/hashlink/Brewfile --no-lock
	make -C deps/hashlink
	make install -C deps/hashlink
	haxelib setup /usr/local/lib/haxe/lib

build:
	xcodebuild -project App.xcodeproj -target App build

install:
	ios-deploy -b build/Release-iphoneos/*.app -d

clean:
	rm -rf build

heaps-world: heaps-world-hl heaps-world-pak

heaps-world-hl:
	cd deps/heaps/samples && haxelib install --always ../../../config/main.hxml && haxe -hl ../../../out/main.c ../../../config/main.hxml

heaps-world-pak:
	cd deps/heaps/samples && haxe -hl ../../../out/pak.hl ../../../config/pak.hxml && hl ../../../out/pak.hl -out ../../../out/res
