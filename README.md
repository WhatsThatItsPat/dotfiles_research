# dotfiles


something about learing dotfiles

## Restore Instructions

### iTerm2

We'll have to do something with these:
```zsh
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iterm2"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
```

### Terminal App

Need to do `mackup restore`.

Terminal overwrites the symlink, so we have to do manual backups (if we really care about it).


### VS Code

We will probably have to loop through extentions and use `code --install-extension`.