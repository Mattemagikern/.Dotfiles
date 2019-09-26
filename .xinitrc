#!/bin/sh

# merge in .Xdefaults
xrdb -merge ~/.Xdefualts

#set keyboard
setxkbmap se svdvorak -option ctrl:nocaps

#Start 
if [ "$(command -v i3)" > /dev/null 2>&1 ];
then
    exec i3;
fi
