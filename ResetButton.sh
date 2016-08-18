#!/bin/bash

# We need to find out what resolutions are available to us so that the script doesn't complain later on.
#  For whatever reason we have had issues when trying to set the same resolution manually on all the
#  Mac Minis.  To get around this we run our screen resolution utility and filter out the closet
#  resolution to 1024x768.  For some reason, some of these systems list different variations of
#  1024X768.  For example, 1024x768x @60 1024x768x32@60.  Not sure why this is but to get around it
#  We can run the following command...

resolution=`/usr/local/bin/screenresolution list | sed 's/ //g' | grep 1024x768x32 | awk '{print $1}'`


#  Kill Firefox if it is already running so that we don't end up with multiple instances.
#  Check-Ins will complain if the site is open in multiple tabs and windows.  Since the
#  purpose of this script is a reset button of sorts, we will assume that Firefox may
#  already be running and needs to be "refreshed."

# Trying to find a polite way to close Firefox from the command line.  killall by itself seems to cause
# Firefox to react as if it had crashed and when we open it back up it will ask to restore the session.
# However, simply closing it using Applescript has the potential to leave a Firefox instance still running
# which will cause errors with our check in station.
# Doing a 'tell application "Firefox" to quit' and then a killall Firefox from the command line seems to
# resolve both of these issues.

osascript -e 'tell application "Firefox" to quit'
killall Firefox

#Make sure that our screen resolution get's set to 1024x768.  For whatever reason not all of the minis
#will work with the same command so we need to run screenresolution and find the list of available modes
#to use for our variable.
/usr/local/bin/screenresolution set $resolution

#Open Firefox

osascript -e 'tell application "Firefox" to open location "https://check-ins.planningcenteronline.com/station/events"'
osascript -e 'tell application "System Events" to set frontmost of process "firefox" to true'
sleep 2
osascript -e 'tell application "System Events" to keystroke "f" using {control down, command down}'
# Finally, kill Terminal when we are done.

killall Terminal
