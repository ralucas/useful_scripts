#!/bin/bash

dir=`pwd`/$1
message=$2

today="$(date '+%d')"
tomorrow="$(($today + 1))"

echo "<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
  <dict>
    <key>Git Push</key>
    <string>com.gitpush.task</string>
    <key>ProgramArguments</key>
    <array>
      <string>"$HOME/scripts/git_push.sh"</string>
      <string>"$dir"</string>
      <string>"$message"</string>
    </array>
    <key>StartCalendarInterval</key>
    <dict>
      <key>Hour</key>
      <integer>1</integer>
      <key>Day</key>
      <integer>"$tomorrow"</integer>
    </dict>
  </dict>
</plist>" > $HOME/Library/LaunchAgents/com.gitpush.task.plist

