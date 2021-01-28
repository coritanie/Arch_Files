#!/bin/bash
#set -e
###############################################################################
# Author	:	Erik Dubois
# Website	:	https://www.erikdubois.be
# Website	:	https://www.arcolinux.info
# Website	:	https://www.arcolinux.com
# Website	:	https://www.arcolinuxd.com
# Website	:	https://www.arcolinuxb.com
# Website	:	https://www.arcolinuxiso.com
# Website	:	https://www.arcolinuxforum.com
###############################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
###############################################################################


###############################################################################
#
#   DECLARATION OF FUNCTIONS
#
###############################################################################


func_install() {
	if pacman -Qi $1 &> /dev/null; then
		tput setaf 2
  		echo "###############################################################################"
  		echo "################## The package "$1" is already installed"
      	echo "###############################################################################"
      	echo
		tput sgr0
	else
    	tput setaf 3
    	echo "###############################################################################"
    	echo "##################  Installing package "  $1
    	echo "###############################################################################"
    	echo
    	tput sgr0
    	sudo pacman -S --noconfirm --needed $1
    fi
}

###############################################################################
echo "Installation of the core software"
###############################################################################

list=(
lightdm
arcolinux-lightdm-gtk-greeter
arcolinux-lightdm-gtk-greeter-settings
arcolinux-wallpapers-git
atom
dmenu
feh
firefox
geany
gmrun
gsimplecal
meld
nitrogen
numlockx
scrot
termite
variety
vlc
adobe-source-sans-pro-fonts
awesome-terminal-fonts
noto-fonts
ttf-bitstream-vera
ttf-dejavu
ttf-droid
ttf-hack
ttf-inconsolata
ttf-liberation
ttf-roboto
ttf-ubuntu-font-family
arc-icon-theme
arc-gtk-theme
kvantum-qt5
openbox-arc-git
arandr
asciinema
bash-completion
catfish
dconf-editor
dex
discord
dmidecode
edid-decode-git
evince
expac
file-roller
git
gksu
gnome-disk-utility
gnome-keyring
gnome-screenshot
gparted
hardinfo
htop
hw-probe
intltool
iw
jsoncpp
libmtp
laptop-detect
lsb-release
mlocate
nomacs
oh-my-zsh-git
p7zip
playerctl
polkit
polkit-gnome
python2-dbus
python2-xdg
qt5ct
rofi
rxvt-unicode
speedtest-cli
telegram-desktop
tlp
tree
gufw
unace
unrar
unzip
w3m
webkit2gtk
wmctrl
xapps
xdo
xdotool
xdg-desktop-portal-gtk
zenity
zsh
zsh-completions
zsh-syntax-highlighting
bibata-cursor-theme
ttf-font-awesome
ttf-ms-fonts
sardi-icons
surfn-icons-git
mkinitcpio-openswap
appstream
archiso
conky-lua-archers
downgrade
gitahead-bin
grub-customizer
hardcode-fixer-git
inxi
mintstick-git
neofetch
pamac-all
pamac-aur
python-pyparted
sublime-text-dev
the_platinum_searcher-bin
trizen
urxvt-perls
urxvt-resize-font-git
yad
yay-bin
arcolinux-bin-git
arcolinux-common-git
arcolinux-conky-collection-git
arcolinux-docs-git
arcolinux-fonts-git
arcolinux-geany-git
arcolinux-grub-theme-vimix-git
arcolinux-hblock-git
arcolinux-keyring
arcolinux-kvantum-git
arcolinux-kvantum-theme-arc-git
arcolinux-lightdm-gtk-greeter
arcolinux-lightdm-gtk-greeter-settings
arcolinux-local-applications-git
arcolinux-local-xfce4-git
arcolinux-logout-git
arcolinux-logout-themes-git
arcolinux-mirrorlist-git
arcolinux-neofetch-git
arcolinux-nitrogen-git
arcolinux-obmenu-generator-xtended-git
arcolinux-openbox-themes-git
arcolinux-pipemenus-git
arcolinux-polybar-git
arcolinux-qt5-git
arcolinux-rofi-git
arcolinux-rofi-themes-git
arcolinux-root-git
arcolinux-system-config-git
arcolinux-termite-themes-git
arcolinux-tweak-tool-git
arcolinux-variety-git
arcolinux-wallpapers-git
arcolinux-zsh-git
arcolinux-awesome-git
arcolinux-bspwm-git
arcolinux-dwm-git
arcolinux-dwm-slstatus-git
arcolinux-herbstluftwm-git
arcolinux-i3wm-git
arcolinux-openbox-xtended-git
arcolinux-qtile-git
arcolinux-spectrwm-git
arcolinux-xfce-git
arcolinux-xmonad-polybar-git
arcolinux-config-all-desktops-git
arcolinux-config-xtended-git
arcolinux-xtended-dconf-git
arcolinux-welcome-app-git
picom
volumeicon
obmenu-generator
perl-linux-desktopfiles
lxappearance
exo
garcon
thunar
thunar-volman
tumbler
xfce4-appfinder
xfce4-panel
xfce4-power-manager
xfce4-settings
xfce4-terminal
xfconf
xfwm4
ristretto
thunar-archive-plugin
thunar-media-tags-plugin
xfce4-clipman-plugin
xfce4-notifyd
xfce4-screenshooter
xfce4-taskmanager
polybar
awesome
vicious
bspwm
sxhkd
xdo
sutils-git
xtitle-git
herbstluftwm
i3-gaps
i3status
autotiling
obconf
openbox
qtile
python-psutil
spectrwm
xmonad
xmonad-contrib
xmonad-utils
haskell-dbus
xmonad-log
checkupdates-aur
perl-checkupdates-aur
xmobar
xdo
autorandr
arcolinux-dwm-git
arcolinux-dwm-slstatus-git
arcolinux-dwm-st-git
)

count=0

for name in "${list[@]}" ; do
	count=$[count+1]
	tput setaf 3;echo "Installing package nr.  "$count " " $name;tput sgr0;
	func_install $name
done

###############################################################################

tput setaf 6;echo "################################################################"
echo "Copying all files and folders from /etc/skel to ~"
echo "################################################################"
echo;tput sgr0
cp -Rf ~/.config ~/.config-backup-$(date +%Y.%m.%d-%H.%M.%S)
cp -arf /etc/skel/. ~

tput setaf 5;echo "################################################################"
echo "Enabling lightdm as display manager"
echo "################################################################"
echo;tput sgr0
sudo systemctl enable lightdm.service -f

tput setaf 7;echo "################################################################"
echo "You now have a very minimal functional desktop"
echo "################################################################"
echo;tput sgr0

tput setaf 11;
echo "################################################################"
echo "Reboot your system"
echo "################################################################"
echo;tput sgr0
