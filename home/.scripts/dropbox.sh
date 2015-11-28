#!/bin/bash
# Get the status from command line applet
DROP_STATUS="$(dropbox-cli status)"

# Define comparison strings
SYNCED="Up to date"
STOPPED="Dropbox isn't running!"
if [ "$DROP_STATUS" == "$STOPPED" ]; then
	echo  OFF # Long message
elif [ "$DROP_STATUS" == "$SYNCED" ]; then
	echo  Synced # Long message
else
	echo  Syncing # Long message
fi