#!/bin/bash

# Remove existing files and folders to avoid conflicts
rm -rf ~/.bashrc ~/.bash_profile ~/.config/{cava,fish,hypr,kitty}

# Define list of folders to skip
skip_folders=("battery-notify" "bin" "dunst" "etc" "ncmpcpp" "oomox" "waybar" "wofi" "wpaperd" "zenbu")

# Get current directory
current_dir=$(pwd)

# Check if all skipped folders exist in the current directory
for folder in "${skip_folders[@]}"; do
  if [ ! -d "$current_dir/$folder" ]; then
    echo "Folder '$folder' not found in current directory '$current_dir'."
    exit 1
  fi
done

# Create symbolic links for all directories except skipped ones
for item in "$current_dir"/*/; do
  if [ -d "$item" ] && [[ ! " ${skip_folders[*]} " =~ " $(basename "$item") " ]]; then
    target=$(basename "$item")
    stow -R "$target"
    echo "Stow command executed: stow \"$target\""
  fi
done

echo "Stow commands successfully executed for all folders except '${skip_folders[*]}'"
