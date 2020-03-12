Forked from https://github.com/thejustinwalsh/heaps-ios

# Run
```sh
git clone https://github.com/qkdreyer/heaps-ios
./app-clone.sh -f https://github.com/HeapsIO/heaps
echo 'World.hx\n-lib heaps\n-lib hlsdl\n-lib hxbit\n-main World\n-D windowSize=1024x768\n-D resourcesPath=world_res\n-cp .' > ./src/samples/world.hxml
ln -sf src/samples/world.hxml .hxml
./app-post-clone.sh
./app-patch.sh
git update-index --assume-unchanged Configuration/Config.xcconfig
```

# Configure
Edit `Configuration/Config.xcconfig`

# Build
```sh
gem install xcpretty
```

`.vscode/tasks.json`
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Xcode",
            "type": "shell",
            "command": "xcodebuild -project App.xcodeproj -target App build | xcpretty",
            "group": "build",
            "problemMatcher": []
        }
    ]
}
```

# Deploy
```sh
npm install -g ios-deploy
```

`.vscode/tasks.json`
```json
{
    "version": "2.0.0",
    "tasks": [
        {
            "label": "Deploy",
            "type": "shell",
            "command": "ios-deploy -b build/Release-iphoneos/*.app -d",
            "group": "build",
            "problemMatcher": []
        }
    ]
}
```
