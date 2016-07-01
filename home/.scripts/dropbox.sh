#!/bin/sh

# Get the status from command line applet
DROP_STATUS="$(dropbox-cli status)"

# Define comparison strings
SYNCED="Up to date"
STOPPED="Dropbox isn't running!"
if [ "$DROP_STATUS" == "$STOPPED" ]; then
  echo '<span background="#007ee5" foreground="white">  OFF </span>'
elif [ "$DROP_STATUS" == "$SYNCED" ]; then
  echo '<span background="#007ee5" foreground="white">  Synced </span>'
else
  echo '<span background="#007ee5" foreground="white">  Syncing </span>'
fi
