// Solution from https://askubuntu.com/questions/1289453/how-do-you-make-a-button-that-performs-a-specific-command
// See what's going on with 
// ```sudo journalctl -f -o cat /usr/bin/gnome-shell```
// Restart the gnome-shell with Alt-F2 r Enter

const {St, Clutter} = imports.gi;
const Main = imports.ui.main;
const Util = imports.misc.util;

let panelButton;

function callKbd() {
  log("Enabling Ovidiu's keyboard");
  Util.spawn(['/bin/bash', '-c', '/usr/local/bin/keyboard.sh']);
}

function init () {
  panelButton = new St.Bin({
    style_class: 'panel-button',
    reactive: true,
    can_focus: true,
    track_hover: true
  });

  let icon = new St.Icon({
    icon_name: 'input-keyboard-sumbolic',
    style_class: 'system-status-icon'
  });
  panelButton.set_child(icon);
  panelButton.connect('button-press-event', callKbd);
}

function enable () {
  // Add the button to the panel
  Main.panel._rightBox.insert_child_at_index(panelButton, 0);
}

function disable () {
  // Remove the added button from panel
  Main.panel._rightBox.remove_child(panelButton);
}
