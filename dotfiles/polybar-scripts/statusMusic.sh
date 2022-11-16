#!/bin/bash
status() {
if [[ $(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'PlaybackStatus'|egrep -A 1 "string"|cut -b 26-|cut -d '"' -f 1|egrep -v ^$ | grep -c Playing ) == 1 ]];
  then
    echo ''
  else
    echo ''
fi
}
status