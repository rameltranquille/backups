systemctl enable cronie.service &
systemctl start cronie.service &
picom -b &
flameshot &
dropbox &
dunst &
todoist sync &
discord &
xfsettingsd &
LC_ALL=en_US.utf8 conky -c .config/conky/conky.conf -o

#xrandr --output DVI-D-0 --primary --mode 1920x1080 --pos 0x1080 --rotate normal --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --output DP-0 --mode 1366x768 --pos 1920x508 --rotate left &
#feh --bg-scale --no-xinerama --randomize .config/qtile/largeWallpapers/the-shooting-star-3840x2160.jpg

#qtile start -c .config/qtile/config.py
exec i3
