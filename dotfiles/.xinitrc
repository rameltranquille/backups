systemctl enable cronie.service &
systemctl start cronie.service &
picom -b &
LC_ALL=en_US.utf8 conky -c .config/conky/conky.conf -o
flameshot &
dropbox &
dunst &
todoist sync &

qtile start -c .config/qtile/config.py
