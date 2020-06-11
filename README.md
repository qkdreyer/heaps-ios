# Heaps iOS
Forked from https://github.com/thejustinwalsh/heaps-ios

![ios](https://github.com/qkdreyer/heaps-ios/workflows/ios/badge.svg?branch=master)
[![demo](https://asciinema.org/a/310075.svg)](https://asciinema.org/a/310075?autoplay=1)

## Setup

```sh
git clone https://github.com/qkdreyer/heaps-ios
cd heaps-ios
make init
```

## Usage

```sh
make heaps-world
make build
make install
```

## Configure

- Edit `Configuration/Config.xcconfig`

# Extra

## Visual Studio Code

`.vscode/tasks.json`
```
{
  // See https://go.microsoft.com/fwlink/?LinkId=733558
  // for the documentation about the tasks.json format
  "version": "2.0.0",
  "tasks": [
    {
      "label": "Build & Run (iOS)",
      "dependsOn": [
        "Build (iOS)",
        "Run (iOS)"
      ],
      "dependsOrder": "sequence",
      "group": {
        "kind": "build",
        "isDefault": true
      },
      "problemMatcher": []
    },
    {
      "label": "Build (iOS)",
      "type": "shell",
      "command": "make build",
      "group": "build",
      "problemMatcher": []
  },
  {
      "label": "Run (iOS)",
      "type": "shell",
      "command": "make install",
      "group": "build",
      "problemMatcher": []
    },
]
}
```
