if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

systemctl enable cronie.service &
systemctl start cronie.service &
picom -b &
flameshot &
dropbox &
dunst &
todoist sync &

exec i3 -c /home/ramel/.config/i3/i3config
