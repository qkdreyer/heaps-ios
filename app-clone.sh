#!/bin/sh

pushd src

while getopts 'f' o; do
    case $o in
        f)
            echo "Cleaning $PWD..."
            rm -rf .* 2>/dev/null
            ;;
    esac
done
shift $((OPTIND-1))

[ -d .git ] && exit 0


REMOTE=$1
BRANCH=${2:-master}

git init
git remote add origin $REMOTE
echo "Fetching remote $REMOTE..."
git fetch origin
echo "Checking out branch $BRANCH..."
git checkout -b $BRANCH --track origin/$BRANCH
