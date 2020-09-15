# dotfiles

Change #1 after creating a branch.
Change #2 in webui.
Change #4 local. Nothing important. I did a regular pull and should try rebase next time.

test-webui-merge-2
1st change
2nd change, via webui
4th change to make it similar to last time...I just did a pull/rebase (without setting it as default and it worked without creating a merge commit.)

I'm learning about dotfiles at [dotfiles.eieio.xyz](http://dotfiles.eieio.xyz).

I learned about dotfiles at [dotfiles.eieio.xyz](http://dotfiles.eieio.xyz), and so can you!

## Decommission Previous Computer (if possible)

Assuming you're not dealing with a theft or drive failure, do what you can to backup files and deactivate licenses.

Backup / sync everything:
1. Time Machine
2. Dropbox
3. Google Drive
4. etc.

Deactivate licenses:
1. Dropbox (Preferences > Account > Unlink)
2. ScreenFlow (Preferences > Licenses > Deactivate)
3. iTunes, etc.



## Restore Instructions

1. `xcode-select --install`. We need this for `git`, among other things.
2. `git clone https://github.com/WhatsThatItsPat/dotfiles.git ~/.dotfiles`. We'll start with `https` but switch to `ssh` after everything is installed.
3. `cd ~/.dotfiles`
4. `source install`
5. Restart computer.
6. Install Dropbox, login, setup, and allow to sync. Alfred and Mackup (Terminal and VS Code) depend on this.
7. `mackup restore`, might want to do `--dry-run` first
8. [Generate ssh key](https://help.github.com/en/github/authenticating-to-github/connecting-to-github-with-ssh), add to github, and switch remotes

    ```zsh
    # Generate SSH key in default location (~/.ssh/config)
    ssh-keygen -t rsa -b 4096 -C "764290+WhatsThatItsPat@users.noreply.github.com"

    # Start the ssh-agent
    eval "$(ssh-agent -s)"

    # Create config file with necessary settings
    << EOF > ~/.ssh/config
    Host *
      AddKeysToAgent yes
      UseKeychain yes
      IdentityFile ~/.ssh/id_rsa
    EOF

    # Add private key to ssh-agent 
    ssh-add -K ~/.ssh/id_rsa

    # Copy public key and add to github.com > Settings > SSH and GPG keys
    pbcopy < ~/.ssh/id_rsa.pub

    # Test SSH connection, then verify fingerprint and username
    # https://help.github.com/en/github/authenticating-to-github/testing-your-ssh-connection
    ssh -T git@github.com

    # Switch from HTTPS to SSH
    git remote set-url origin git@github.com:WhatsThatItsPat/dotfiles.git
    ```


### Manual Steps

#### Snappy App

1. `System Preferences > Keyboard > Shortcuts > Screenshots` and turn off the one for `cmd+shift+4`.
2. In app preferences, switch "take snap" from `cmd+shift+2` (which conflicts with ScreenFlow) to `cmd+shift+4`.

#### Alfred

1. `System Preferences > Keyboard > Shortcuts > Spotlight` and turn off the one for `cmd+space`.
2. `Alfred Preferences > Advanced > Set preferences folder` and set to the one in Dropbox.



#### iTerm2

These will end up in macos_setup.zsh...leave for now:
```zsh
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "~/.dotfiles/iterm2"
defaults write com.googlecode.iterm2 NoSyncNeverRemindPrefsChangesLostForFile -bool true
```

#### Terminal App

no need to mention this...

Need to do `mackup restore`. Terminal overwrites the symlink, so we have to do manual backups (if we really care about it).


#### VS Code

No need to mention this. It will end up in a setup file.

We will probably have to loop through extentions and use `code --install-extension`.


