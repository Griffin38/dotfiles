
ssidStatus() {
if [ "$(iwgetid)" = "" ]; then echo Ethernet; else echo  $(iwgetid -r); fi
}
ssidStatus
