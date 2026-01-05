#!/usr/bin/env bash

set -e

CONFIG_DIR="$HOME/.config"
BACKUP_ROOT="$HOME/.config-backup-$(date +%Y%m%d-%H%M%S)"

PACKAGES=(
  bspwm
  sxhkd
  kitty
  rofi
  polybar
  dunst
  feh
  picom
  xclip
  playerctl
  pamixer
  network-manager-applet
  ttf-jetbrains-mono
  ttf-jetbrains-mono-nerd
)

CONFIG_FOLDERS=(
  bspwm
  sxhkd
  kitty
  rofi
  polybar
  dunst
)

echo "== BSPWM Minimal DE Installer =="
echo

# ------------------ Install packages ------------------
read -rp "Install required packages? [y/N]: " install_pkg
if [[ "$install_pkg" =~ ^[Yy]$ ]]; then
  sudo pacman -S --needed --noconfirm "${PACKAGES[@]}"
fi

mkdir -p "$CONFIG_DIR"

# ------------------ Config handling -------------------
for folder in "${CONFIG_FOLDERS[@]}"; do
  SRC="./$folder"
  DEST="$CONFIG_DIR/$folder"

  if [[ ! -d "$SRC" ]]; then
    echo "Skipping $folder (not found in repo)"
    continue
  fi

  echo
  echo "Config: $folder"

  if [[ -d "$DEST" ]]; then
    read -rp "Existing config found. Backup first? [y/N]: " backup
    if [[ "$backup" =~ ^[Yy]$ ]]; then
      mkdir -p "$BACKUP_ROOT"
      mv "$DEST" "$BACKUP_ROOT/"
      echo "✔ Backed up to $BACKUP_ROOT/$folder"
    else
      rm -rf "$DEST"
      echo "✖ Existing config removed"
    fi
  fi

  cp -r "$SRC" "$DEST"
  echo "✔ Installed $folder config"
done

# ------------------ Permissions ------------------
chmod +x "$CONFIG_DIR/bspwm/bspwmrc" 2>/dev/null || true
chmod +x "$CONFIG_DIR/sxhkd/sxhkdrc" 2>/dev/null || true

echo
echo "✅ Installation complete."
echo "Backup folder (if used): $BACKUP_ROOT"
echo "You can now start bspwm."
