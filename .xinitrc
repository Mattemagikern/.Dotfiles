#!/bin/sh

# merge in .Xdefaults
xrdb -merge ~/.Xdefualts

#set keyboard
setxkbmap se

# Load external screen if any
if xrandr | grep "^DP1 connected" ; then 
    bash ~/.screenlayout/home.sh
elif xrandr | grep "^DP1-1 connected" ; then
    bash ~/.screenlayout/assa.sh
fi


#Start 
if [ "$(command -v i3)" > /dev/null 2>&1 ];
then
    exec i3;
fi
