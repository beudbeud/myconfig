#!/bin/bash

poweroff_command="systemctl poweroff"
reboot_command="systemctl reboot"
logout_command="/usr/bin/gnome-session-quit --logout --no-prompt"
lock_command="xdg-screensaver lock"

# you can customise the rofi command all you want ...
rofi_command="rofi"

#options=$'Shutdown\x00image\x1f/usr/share/icons/Papirus/48x48/apps/gnome-shutdown.svg\n'
options="  Shutdown\n  Reboot\n  Logout\n  Lockscreen"

# ... because the essential options (-dmenu and -p) are added here
command=$(echo -e $options | ilia -p textlist | cut -d' ' -f2)
if [ $? == 0 ]
then
	case "${command}" in
		"Shutdown") eval $poweroff_command;;
		"Reboot") eval $reboot_command;;
		"Logout") eval $logout_command;;
		"Lockscreen") eval $lock_command;;
	esac
fi
