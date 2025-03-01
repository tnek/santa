-- Installs the passed profile (.mobileconfig).
-- This is run inside test VMs, primarily to configure Santa.

on run argv
	do shell script "open " & item 1 of argv

	if application "System Preferences" is running then
		tell application "System Preferences" to quit
	end if

	delay 2

	tell application "System Preferences" to activate

	delay 2

	tell application "System Events"
		tell process "System Preferences"
			click menu item "Profiles" of menu 1 of menu bar item "View" of menu bar 1
			delay 3
			click button "Install…" of scroll area 1 of window "Profiles"
			delay 2
			click button "Install" of sheet 1 of window "Profiles"
		end tell
		delay 2
		tell process "SecurityAgent"
			set value of text field 2 of window 1 to system attribute "VM_PASSWORD"
			click button 2 of window 1
		end tell
	end tell

	delay 5

	tell application "System Preferences" to quit

	delay 2
end run
