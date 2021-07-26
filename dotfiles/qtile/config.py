import os, subprocess, psutil, time, json
from datetime import datetime
from get_weather import get_weather
from suntime import Sun
from typing import List
from libqtile import bar, layout, widget, hook, extension
from libqtile.command import lazy
from libqtile.config import Click, Drag, Match 
from libqtile.config import Screen, Key, Group, ScratchPad, DropDown
from libqtile.lazy import lazy

terminal = "alacritty"

class Colorscheme:
    fg = "#F7BFC0"
    bg = "#0F161E"
    bg2 = "#45425C"
    alt = "#A29AC3"
    alt2 = "#FCDACE"
    alt3 = "#FB676E"
    ## Standard Colors
    black = "#000000"
    green = "#00ff00"
    red = "#ff0000"
    white = "#ffffff"

###############################
### Solunar Function
###############################

longi, lati =  40.71, -74.00
def solunar(longi, lati):
    sun = Sun(longi, lati)
    today_sr = sun.get_sunrise_time().hour - 5 # subtract 5 for UTC to EST
    today_ss = sun.get_sunset_time().hour - 5
    current_time = time.localtime().tm_hour
    
    sunout = current_time < today_ss and current_time > today_sr

    if sunout:
        wp ="~/.config/qtile/wallpapers/okn6nm70i5w61.jpg"
    else:
        wp ="~/Downloads/suct6s8nq6b21.png"
    return wp

###############################
### Groups
###############################

g1 = Group("1st", spawn="firefox ~/docs/AStudent.pdf calendar.google.com gmail.com")
g2 = Group("2nd", layout=layout.Columns())
g3 = Group("3rd")
g4 = Group("Music", spawn=["alacritty -e cmus", "pavucontrol"],
        layout=layout.Columns())
g5 = Group("Stonks", spawn="tastyworks", layout=layout.Max())


groups = [g1, g2, g3, g4, g5,
    ScratchPad("scratchpad", 
    [DropDown("notes", "st notetaker", opacity=0.8),])
]

###############################
### Matching 
###############################


###############################
### KEYS
###############################
mod = "mod4"
mod2 = "mod1"

class Command:
    vim = "alacritty -e vim"
    bpytop = "alacritty -e bpytop"
    open_with_fzf = "alacritty -e open_with_fzf"
    volume_up = "amixer -D pulse sset Master 5%+"
    volume_down = "amixer -D pulse sset Master 5%-"
    volume_toggle = "amixer -q set IEC958 toggle"
    dmenu_run_i = "dmenu_run_i"
    dmenu_notetaker = "dmenu_notetaker"
    dmenu_task = "dmenu_task"
    cmus = "alacritty -e cmus"

keys = [
    # Free Keys: z, d, 
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod], "g", lazy.layout.next()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    Key([mod], "q", lazy.layout.grow_left()),
    Key([mod], "w", lazy.layout.grow_right()),
    Key([mod], "e", lazy.layout.grow_down()),
    Key([mod], "r", lazy.layout.grow_up()),

    Key([mod, "shift"], "q", lazy.grow()),
    Key([mod, "shift"], "w", lazy.layout.shrink()),
    Key([mod, "shift"], "e", lazy.layout.normalize()),
    Key([mod, "shift"], "r", lazy.layout.maximize()),

    Key([mod], "a", lazy.to_screen(0)),
    Key([mod], "s", lazy.to_screen(1)),
    Key([mod], "f", lazy.window.toggle_fullscreen()),

    # Bottom Row: Spawning Apps (Z-M) + (T)
    Key([mod], "z", lazy.spawn("pavucontrol")),
    Key([mod, "shift"], "z", lazy.spawn(Command.cmus)),
    Key([mod], "x", lazy.spawn("firefox")),
    Key([mod, "shift"], "x", lazy.spawn("firefox --private-window")),
    Key([mod], "c", lazy.spawn(Command.open_with_fzf)),
    Key([mod], "v", lazy.spawn(Command.vim)),
    Key([mod, "shift"], "v", lazy.spawn("code")),
    
    Key([mod], "b", lazy.spawn(Command.bpytop)),
    # I, O, P: Volume
    Key([mod], "i", lazy.spawn(Command.volume_up)),
    Key([mod], "o", lazy.spawn(Command.volume_down)),
    Key([mod], "p", lazy.spawn(Command.volume_toggle)),

    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod, "shift"], "Return", lazy.spawn("st")),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "space", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),
    ### Dmenu Keys
    Key([mod], "m", lazy.spawn(Command.dmenu_run_i)),
    # Key([mod], "t", lazy.spawn(Command.dmenu_task)),
    # Key([mod], "y", lazy.spawn(Command.dmenu_notetaker)),
    Key([mod], "y", lazy.run_extension(extension.Dmenu(
        dmenu_command = "passmenu",
        foreground=Colorscheme.bg2,
        selected_background=Colorscheme.alt))),
    Key([mod], "t", lazy.run_extension(extension.Dmenu(
        dmenu_command = "dmenu_task"))),
    Key([mod, "shift"], "n", lazy.run_extension(extension.DmenuRun(
        dmenu_command = "dmenu_notetaker",
        dmenu_prompt = "note>>"))),
    Key([mod], "n", lazy.group['scratchpad'].dropdown_toggle('notes')),
        
]

for index, grp in enumerate(groups):
    keys.extend([
        Key([mod], str(index+1), lazy.group[grp.name].toscreen(),
            desc="Switch to group {}".format(grp.name)),
        Key([mod, "shift"], str(index+1), lazy.window.togroup(grp.name),
            desc="move focused window to group".format(grp.name)),
        Key([mod, "control"], str(index+1), lazy.window.togroup(
            grp.name,
            switch_group=True),
            desc="moved focused window to group and switch to group")
    ])

###############################
### LAYOUTS
###############################
layout_defaults = dict(
        border_focus=Colorscheme.alt3, 
        border_width=1,
        margin=5
)

layouts = [
    layout.Columns(**layout_defaults, num_columns=3),
    layout.Max(),
    layout.MonadTall(**layout_defaults),
    layout.Floating(**layout_defaults)
]

###############################
### CUSTOM WIDGETS
###############################

class Stats(widget.base.InLoopPollText):

    def __init__(self, **config):
        widget.base.InLoopPollText.__init__(self, **config)
        self.update_interval = 1

    def get_cpuload(self):
        loadavg = psutil.getloadavg()
        load_percents = [round(x / psutil.cpu_count() * 100.0, 2) for x in loadavg]
        return "LA: {}%".format(load_percents)

    def get_temp(self):
        temp_lst = psutil.sensors_temperatures()
        temp = temp_lst['k10temp']
        current_temp = temp[1].current
        return "{}*C".format(current_temp)

    def get_storage(self):
        st = psutil.disk_usage("/")
        freegb = st.free / 1000000000
        freegb_perc = st.used / st.total * 100
        return "{}GB Free".format(round(freegb))

    def poll(self):
        stat = [self.get_cpuload(), self.get_storage(), self.get_temp(),]
        return " | ".join(stat)

class Todo(widget.base.InLoopPollText):

    def __init__(self, **config):
        widget.base.InLoopPollText.__init__(self, **config)
        self.update_interval = 1

    def poll(self):
        with open('/home/ramel/.todos.json') as t1:
            js = json.load(t1)
            main_task = js[0]['subject']

        return "task:" + main_task

class Gcal(widget.base.InLoopPollText):

    def __init__(self, **config):
        widget.base.InLoopPollText.__init__(self, **config)
        self.update_interval = 200

    def poll(self):
        event = subprocess.check_output('head -2 /tmp/gcalcli_agenda.txt | tail -1', 
                shell=True).decode('utf-8').rstrip('\n')
        main_event = " ".join(event.split())
        return main_event

class Weather(widget.base.ThreadPoolText):

    def __init__(self, **config):
        widget.base.ThreadPoolText.__init__(self, "", **config)
        self.update_interval = 10000

    def poll(self):
        weather_string = get_weather()
        return weather_string

###############################
### WIDGETS / SCREENS / BAR
###############################

widget_defaults = dict(
    foreground=Colorscheme.fg,
    background=Colorscheme.bg,
    font='jetbrains mono light',
    fontsize=10,
    padding=3,
)

extension_defaults = widget_defaults.copy()

sep = widget.Sep(linewidth=1, size_percent=80)

screens = [
        Screen(top=bar.Bar([
                    widget.CurrentLayout(), sep,
                    widget.GroupBox(
                        highlight_method="line",
                        active=Colorscheme.fg,
                        # inactive=Colorscheme.alt3,
                        this_current_screen_border=Colorscheme.alt3,
                        # other_current_screen_border=Colorscheme.alt3
                        ),
                    sep,
                    widget.WindowName(),
                    widget.Chord(
                        chords_colors={
                            'launch': (Colorscheme.black, Colorscheme.green),
                        },
                        name_transform=lambda name: name.upper(),
                    ),
                    # widget.Notify(foreground=Colorscheme.alt3,
                    #     foreground_urgent=Colorscheme.alt2),
                    widget.Cmus(),
                    widget.Clock(format='%m-%d-%y %a %I:%M %p'),
                    widget.Systray(),
                    widget.CurrentScreen(
                        active_color=Colorscheme.alt,
                        inactive_color=Colorscheme.alt),
                    ], 18
                ),
            bottom=bar.Bar([
                    widget.Net(format='{down}↓↑{up}'), sep,
                    widget.CPU(), sep,
                    Stats(), sep,
                    widget.Memory(format='Mem: {MemPercent}%'), sep,
                    widget.PulseVolume(volume_app="pavucontrol"), sep,
                    Todo(), sep,
                    Weather(), sep,
                    Gcal(), sep
                    # widget.NvidiaSensors(),
                    ], 18,
                    background=Colorscheme.bg
                ),
            wallpaper=solunar(longi, lati),
            wallpaper_mode="fill"
            ),
        Screen(top=bar.Bar([
                    widget.CurrentLayout(),
                    widget.WindowName(),
                    widget.Clock(format='%m-%d-%y %a %I:%M %p'),
                    ], 18
                ),
            wallpaper=solunar(longi, lati),
            wallpaper_mode="fill"
            )
]


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

kgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False

floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key
], border_focus=Colorscheme.alt3, border_width=1)
    

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
# auto_minimize = True

wmname = "QTILE"
