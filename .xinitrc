#!/bin/sh

# merge in .Xdefaults
[ -f ~/.Xdefaults ] && xrdb -merge ~/.Xdefaults

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

#Start 
loadxkbmap se svdvorak
if [ "$(command -v i3)" >/dev/null 2>&1 ];
then
    exec i3;
fi
