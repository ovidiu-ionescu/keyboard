#!/usr/bin/env bash
set -x

cd "$( dirname "${BASH_SOURCE[0]}" )"

DEST=/usr/share/X11/xkb/
sudo cp -r keycodes $DEST
sudo cp -r symbols $DEST
