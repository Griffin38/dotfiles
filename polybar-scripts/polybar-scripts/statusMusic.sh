#!/bin/bash
status() {
if [[ $(playerctl status) == 'Playing' ]];
  then
    echo ' '
  else
    echo ' '
fi
}
status
