#!/bin/bash
# Make scoll lock an overlay switch

# check if gnome is running
if [ -z "$(pgrep gdm3)" ]; then
	exit 0
fi

_x=${DISPLAY:=:1}; export DISPLAY; unset _x

cd ~/.xkb
#xkbcomp oi_config :0
#xkbcomp oi_config :1
xkbcomp oi_config ${DISPLAY} 2>/dev/null

# set the keyboard shortcuts to start gnome-terminal, alacritty
# the shortcuts were initially set using the GUI -> Keboard Settings but the system forgets the keys every
# time the screen is locked.
#
# Instructions from https://itectec.com/ubuntu/ubuntu-how-to-set-a-custom-keyboard-shortcut-from-a-bash-script-with-gnome3-in-ubuntu-18-04/
#

P=org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings
# gsettings list-keys $P/custom0/
# See the binding name:
# gsettings get $P/custom0/ name
gsettings set $P/custom0/ binding 'F14'
# gsettings get $P/custom0/ binding

# gsettings get $P/custom1/ name
gsettings set $P/custom1/ binding 'F15'
# gsettings get $P/custom1/ binding

# gsettings get $P/custom2/ name
gsettings set $P/custom2/ binding 'F17'
# gsettings get $P/custom2/ binding
