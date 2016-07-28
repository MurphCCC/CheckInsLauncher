# CheckInsLauncher


A combination of AppleScripts and Bash scripts to help us manage the 8 Mac Mini's that we currently have set up for our children's check in system.  We use Planning Center Check-ins running on Mac Mini's with an iPad attached to each running Duet.  This allows us to use the iPad as a touchscren monitor for the Mac Mini.  This gives us the advantage of being able to streamline things a little bit and gives us the ability to run everything in Firefox so that we can customize the check-ins UI somewhat using custom stylesheets and Firefox plugins.

Currently this project contains the following scripts:

Launcher - This is my first AppleScript.  It loads Remote Desktop, connects to all 8 of the Mac Minis, and then resizes each window and lines them up in a row on a retina screen.  It is very basic and lacks any sort of error checking or correction.  It is pretty buggy and frequently will throw errors when it cannot connect to a Mini.  The purpose of this script is for administration purposes, it is only here to make the job of the person/persons managing the check in stations easiser.  I wrote it because I got tired of having to manually open remote desktop, connect to each computer one by one, resize each window and move them around into a grid.  This script can be easily modified to fit a variety of different uses.

ResetButton - This script is very simple.  It is a bash script that also executes some AppleScript using the 'osascript -e' command.  The purpose of this script is to automatically set the Mac Mini at a resolution of 1024x768, Open a fresh copy of Firefox to the current Check Ins event and send Firefox into full screen mode.  It is set to run at login, and an icon is placed in the dock so that it can easily be ran whenever needed.
