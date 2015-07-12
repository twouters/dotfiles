#!/bin/sh

#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)
#

wmname LG3D
xrdb ~/.Xresources

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

xset +fp /usr/share/fonts/local/
xset +fp /usr/share/fonts/misc/
xset +fp /usr/share/fonts/microsoft/
xrandr --dpi 96

hsetroot -solid "#181818"

setxkbmap -option caps:none

/usr/bin/start-pulseaudio-x11
export PULSE_LATENCY_MSEC=60

# required according to gpg-agent(1)
export GPG_TTY=$(tty)
unset SSH_AGENT_PID
if [ "${gnupg_SSH_AUTH_SOCK_by:-0}" -ne $$ ]; then
  export SSH_AUTH_SOCK="${HOME}/.gnupg/S.gpg-agent.ssh"
fi
# engage gpg-agent
gpg-connect-agent /bye

PATH=${PATH}:~/.cabal/bin

exec i3
