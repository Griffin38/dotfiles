#!/bin/sh

if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
  if [ "$(echo -e "devices" | bluetoothctl | grep Mpow)" != '' ]; then
    echo ""
  else
	  echo ""
  fi
else
	echo ""
fi
