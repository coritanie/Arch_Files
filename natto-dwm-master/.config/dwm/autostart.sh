!#/bin/bash

#Arcolinux-Welcome-App
~/.config/dwm/scripts/start-welcome-app.sh

#Authentication dialog
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

#feh sets wallpaper
feh --bg-fill ~/arco-wallpaper.jpg &

#Picom
picom -b --config ~/.config/dwm/scripts/picom.conf &

#SXHKD
sxhkd -c ~/.config/dwm/sxhkd/sxhkdrc &

#DWMBar
~/.config/dwm-bar/dwm_bar.sh &

# Updater
pamac-tray &

# bluetooth
blueberry-tray &

# network
nm-applet &

# num lock activated
numlockx on &

# dropbox
#dropbox
 
#Discord
discord &

#Telegram-Desktop
#telegram-desktop &

# insync
#insync 

# volume
volumeicon &

#variety
#variety &

# clipman
xfce4-clipman

#Conky
#conky -c ~/.config/conky/system-overview

#Polybar
#$HOME/.config/polybar/launch.sh &



