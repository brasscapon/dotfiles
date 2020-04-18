#!/bin/bash

echo "removing old dotfiles..."
rm -rf ~/.dotfiles

echo "downloading new dotfiles..."
cd ~ && git clone git@github.com:AdamDemirel/.dotfiles.git

echo "setting up symlinks..."
rm ~/.zshrc
rm ~/.gitconfig
rm ~/.yaourtrc
rm ~/.config/Code\ -\ OSS/User/settings.json
rm ~/.config/Code\ -\ OSS/User/keybindings.json

ln -s ~/.dotfiles/.zshrc ~/.zshrc
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/.yaourtrc ~/.yaourtrc
ln -s ~/.dotfiles/settings.json ~/.config/Code\ -\ OSS/User/settings.json
ln -s ~/.dotfiles/keybindings.json ~/.config/Code\ -\ OSS/User/keybindings.json

echo "installing vscode extensions..."
cat ~/.dotfiles/extensions.txt | xargs -n 1 code --install-extension
