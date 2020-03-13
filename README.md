Forked from https://github.com/thejustinwalsh/heaps-ios

# Run
`compile.hxml`
```
World.hx
-lib heaps
-lib hlsdl
-lib hxbit
-main World
-D windowSize=1024x768
-D resourcesPath=world_res
-cp .
```

```sh
git clone https://github.com/qkdreyer/heaps-ios
ln -s deps/heaps/samples/ src
./bin/bootstrap.sh src/compile.hxml
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
