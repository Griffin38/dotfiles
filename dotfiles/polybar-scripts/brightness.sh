#!/bin/sh

if [ "$(systemctl is-active bluetooth.service)" = "active" ]; then
  if [ "$(echo -e "devices" | bluetoothctl | grep Mpow | wc -l)" == 3 ]; then
    echo ""
  else
	  echo ""
  fi
else
	echo ""
fi