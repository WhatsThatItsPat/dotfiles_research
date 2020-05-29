#!/usr/bin/env zsh

echo "\n~~~ Starting macOS Setup ~~~\n"


osascript -e 'tell application "System Preferences" to quit'

### Finder / Directory

# Finder > View > Show Path Bar
defaults write com.apple.finder ShowPathbar -bool true
#               > As List (don't think I'll do this one)
# defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# https://github.com/joeyhoer/starter/blob/master/apps/finder.sh#L136
# New window target (overlay this with screenflow?)
# Computer     : `PfCm`
# Volume       : `PfVo`
# $HOME        : `PfHm`
# Desktop      : `PfDe`
# Documents    : `PfDo`
# All My Files : `PfAF`
# Other…       : `PfLo`
# Finder > Preferences > General > New Finder windows show:
defaults write com.apple.finder NewWindowTarget -string 'PfLo'
defaults write com.apple.finder NewWindowTargetPath "file://$HOME/.dotfiles"
defaults write com.apple.finder NewWindowTargetPath -string "file://$HOME/.dotfiles"

# Finder > Preferences > Advanced > Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true
#                                 > Show warning before changing an extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
#                                 > Keep folders on top when sorting by name
# defaults write com.apple.finder _FXSortFoldersFirst -bool true

# Show Library folder
# https://github.com/mathiasbynens/dotfiles/issues/865#issuecomment-524163699
xattr -d com.apple.FinderInfo ~/Library 2>/dev/null
chflags nohidden ~/Library

# Show hidden files
# defaults write com.apple.finder AppleShowAllFiles YES





# *** SYSTEM PREFERENCES ***

#     > General (don't show?)
defaults write -g AppleShowScrollBars 'Always'

# Keyboard > Text
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

#     > Keyboard > Shortcuts
# com.apple.symbolichotkeys...this is where cmd+shift+4 is. 


# Dock
# System Preferences > Dock
defaults write com.apple.dock magnification -bool true
defaults write com.apple.dock tilesize -float 60
defaults write com.apple.dock largesize -float 110
defaults write com.apple.dock autohide -bool true
defaults write com.apple.dock autohide-delay -float 0.1
defaults write com.apple.dock autohide-time-modifier -float .25
# defaults write com.apple.dock orientation -string left
# defaults write com.apple.dock static-only -bool true
killall Dock




# Trackpad / Mouse / Zoom

# Enable 3-finger drag. (Moving with 3 fingers in any window "chrome" moves the window.)
# System Preferences > Accessibility > Pointer Control > Mouse & Trackpad > Trackpad Options > Enable Dragging > Three Finger Drag
defaults write com.apple.AppleMultitouchTrackpad TrackpadThreeFingerDrag -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad TrackpadThreeFingerDrag -bool true


# System Preferences > Trackpad > Tap to click
defaults write com.apple.AppleMultitouchTrackpad Clicking -bool false
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool false

# defaults write com.apple.AppleMultitouchTrackpad Clicking -int 0
defaults write com.apple.AppleMultitouchTrackpad FirstClickThreshold -int 2







# https://apple.stackexchange.com/a/362308/310704
# but the Enable Dragging checkbox isn't checked
# Accessibility > Pointer Control > Mouse & Trackpad > Trackpad Options > Enable Dragging (but this doesn't check it)
defaults write com.apple.AppleMultitouchTrackpad Dragging -bool true
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Dragging -bool true
# defaults write com.apple.AppleMultitouchTrackpad Dragging -int 1


# This doesn't work
# Enable scroll-to-zoom with Ctrl (^) modifier key (and 2 fingers).
# defaults write com.apple.universalaccess closeViewScrollWheelToggle -bool true
# defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad HIDScrollZoomModifierMask -int 262144
# defaults write com.apple.AppleMultitouchTrackpad HIDScrollZoomModifierMask -int 262144






# Others?



# More others


# Icons for hard drives, servers, and removable media on the desktop
# defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool false
# defaults write com.apple.finder ShowHardDrivesOnDesktop         -bool false
# defaults write com.apple.finder ShowMountedServersOnDesktop     -bool false
# defaults write com.apple.finder ShowRemovableMediaOnDesktop     -bool false



# defaults write com.apple.Safari AutoOpenSafeDownloads -boolean NO
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false



# Prevent left and right swipe through history in Chrome
# defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool false


# System Preferences > Keyboard > Shortcuts > Screenshots
# I'd like to uncheck "Save picture of selected area as a file (cmd+shift+4)" so I can use that for Snappy.
# couldn't figure out `--dict-add`