#!/usr/bin/env bash
set -x

cd "$( dirname "${BASH_SOURCE[0]}" )"

DEST=/usr/share/X11/xkb/
sudo sed -i 's/FK\(\(1[3-9]\)\|\(2[0-9]\)\)> =/FX\1> =/g' $DEST/keycodes/evdev
sudo sed -i '/<STOP\|<AGAI\|<FRNT\|<COPY\|<PAST/d' $DEST/symbols/inet
sudo cp symbols/ro $DEST/symbols/ro
