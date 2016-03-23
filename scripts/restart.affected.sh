#!/usr/bin/env bash

for app in \
  "Activity Monitor" \
  "Address Book" \
  "Calendar" \
  "Contacts" \
  "cfprefsd" \
  "Dock" \
  "Finder" \
  "Mail" \
  "Messages" \
  "Safari" \
  "Spectacle" \
  "SystemUIServer" \
  "Terminal" \
  "Transmission" \
  "iCal"; do

  killall "${app}" > /dev/null 2>&1
done

exit 0
