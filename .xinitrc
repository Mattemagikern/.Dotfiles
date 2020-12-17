#!/bin/sh

# merge in .Xdefaults
xrdb -merge ~/.Xdefaults

#set keyboard
setxkbmap se svdvorak -option ctrl:nocaps
xdg-settings set default-web-browser org.qutebrowser.qutebrowser.desktop

#Start 
if [ "$(command -v i3)" > /dev/null 2>&1 ];
then
    exec i3;
fi
