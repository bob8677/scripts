#!/bin/fish

set action (echo Lock\nReboot\nShutdown\nSuspend\nExit | dmenu -p 'What Would You Like To Do?')

switch $action
	case Lock
		xdg-screensaver activate;
	case Reboot
		prompt.sh "Are you sure you want to reboot?" "reboot";
	case Shutdown
		prompt.sh "Are you sure you want to reboot?" "shutdown now";
	case Suspend
		prompt.sh "Are you sure you want to Suspend?" "systemctl suspend";
	case Exit
		prompt.sh "Are you sure you want to exit?" "killall xinit";
end
