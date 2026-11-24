#!/bin/bash

# Colors for output
GREEN='\033[0;32m'
RED='\033[0;31m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Dry-run mode: ./deploy.sh --dry-run  or  DRY_RUN=1 ./deploy.sh
DRY_RUN=${DRY_RUN:-0}
if [ "${1:-}" = "--dry-run" ]; then
  DRY_RUN=1
fi

if [ "$DRY_RUN" -eq 1 ]; then
  echo -e "${YELLOW}Dry-run mode: commands are only printed, nothing is executed.${NC}"
fi

# Run a command and highlight its result: green on success, red on error
run_cmd() {
  if [ "$DRY_RUN" -eq 1 ]; then
    echo -e "${YELLOW}[dry-run] $*${NC}"
    return 0
  fi
  echo -e "${YELLOW}==> $*${NC}"
  "$@"
  local status=$?
  if [ $status -eq 0 ]; then
    echo -e "${GREEN}✔ Success: $*${NC}"
  else
    echo -e "${RED}✘ Error (exit code $status): $*${NC}"
  fi
  return $status
}

# Remove existing files and folders to avoid conflicts
run_cmd rm -rf ~/.bashrc ~/.bash_profile ~/.config/{cava,fish,hypr,kitty}

# Define list of folders to skip
skip_folders=("bin" "dunst" "etc" "ncmpcpp" "oomox" "waybar" "wofi" "wpaperd" "zenbu")

# Get current directory
current_dir=$(pwd)

# Check if all skipped folders exist in the current directory
for folder in "${skip_folders[@]}"; do
  if [ ! -d "$current_dir/$folder" ]; then
    echo -e "${RED}✘ Folder '$folder' not found in current directory '$current_dir'.${NC}"
    exit 1
  else
    echo -e "${GREEN}✔ Folder '$folder' found.${NC}"
  fi
done

# Create symbolic links for all directories except skipped ones
failures=0
for item in "$current_dir"/*/; do
  if [ -d "$item" ] && [[ ! " ${skip_folders[*]} " =~ " $(basename "$item") " ]]; then
    target=$(basename "$item")
    run_cmd stow -R "$target" || failures=$((failures + 1))
  fi
done

if [ "$DRY_RUN" -eq 1 ]; then
  echo -e "${YELLOW}[dry-run] No changes were made. Remove --dry-run to apply.${NC}"
elif [ $failures -eq 0 ]; then
  echo -e "${GREEN}✔ Stow commands successfully executed for all folders except '${skip_folders[*]}'${NC}"
else
  echo -e "${RED}✘ $failures stow command(s) failed.${NC}"
  exit 1
fi
