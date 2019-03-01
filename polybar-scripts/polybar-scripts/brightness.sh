#!/bin/bash
brightnessCheck() {
MY_BRIGHTNESS=$(brightnessctl -m | grep -o "[0-9]*%")
echo "  $MY_BRIGHTNESS"
}
brightnessCheck
