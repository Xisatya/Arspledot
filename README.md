Arsple: Arch Linux BSPWM Dotfiles

**Requirement List**

With pacman:

xorg-server xorg-xinit xorg-xsetroot xorg-xrandr bspwm sxhkd kitty rofi dmenu polybar picom dunst libnotify feh ttf-jetbrains-mono ttf-jetbrains-mono-nerd noto-fonts noto-fonts-emoji alsa-lib libpulse wireless_tools xdg-user-dirs xdg-utils

With AUR:

tela-icon-theme

**IMPORTANT**

If you are not in a desktop environment (in a terminal environment), make sure you are running the X11 server and then enter bspwm. This is usually done automatically if you are using SDDM.

**Installation (ARCH ONLY)**

$ git clone https://github.com/Xisatya/arspledot

$ cd arspledot

$ chmod +x install.sh

$ ./install.sh
