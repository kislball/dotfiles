#!/bin/sh
sudo pacman -Syu
sudo pacman -S sway waybar micro neovim rofi kitty yay

sudo yay -S nerd-fonts-fira-code noto-fonts

sudo ln -sf $(pwd)/alacritty /home/$(whoami)/.config/alacritty
sudo ln -sf $(pwd)/kitty /home/$(whoami)/.config/kitty
sudo ln -sf $(pwd)/nvim /home/$(whoami)/.config/nvim
sudo ln -sf $(pwd)/rofi /home/$(whoami)/.config/rofi
sudo ln -sf $(pwd)/sway /home/$(whoami)/.config/sway
sudo ln -sf $(pwd)/waybar /home/$(whoami)/.config/waybar