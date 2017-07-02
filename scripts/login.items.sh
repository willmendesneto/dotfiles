#!/usr/bin/env bash
set -eu

osascript -e 'tell application "System Events" to make login item at end with properties {path:"/opt/homebrew-cask/Caskroom/spectacle/0.8.10/Spectacle.app", name:"Spectacle"}'
osascript -e 'tell application "System Events" to make login item at end with properties {path:"/opt/homebrew-cask/Caskroom/caffeine/1.1.1/Caffeine.app", name:"Caffeine"}'
