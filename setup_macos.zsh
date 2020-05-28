#!/usr/bin/env zsh

echo "\n~~~ Starting macOS Setup ~~~\n"

osascript -e 'tell application "System Preferences" to quit'

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true

# Finder > Preferences > General > New Finder windows show:
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/.dotfiles"


# System Preferences > Dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -float 50
defaults write com.apple.dock largesize -float 70
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-time-modifier -float 0.25
defaults write com.apple.dock autohide-delay -float 0.1



# System Preferences > Accessibility > Pointer Control > Mouse & Trackpad > Trackpad Options > Enable Dragging > Three Finger Drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
# Don't think this is necessary
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true


# System Preferences > Keyboard > Shortcuts > Screenshots
# I'd like to uncheck "Save picture of selected area as a file (cmd+shift+4)" so I can use that shortcut for Snappy.
# couldn't figure out \`--dict-add\`
# Snappy settings are here:
# ~/Library/Containers/ro.nextwave.Snappy/Data/Library/Preferences/ro.nextwave.Snappy.plist


# Finish macOS Setup
killall Finder
killall Dock
echo "Done with macOS setup. A logout or restart might be necessary."

