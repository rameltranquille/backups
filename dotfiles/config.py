import os, subprocess, psutil, time, json
from datetime import datetime
from get_weather import get_weather
from typing import List
from libqtile import bar, layout, widget, hook, extension
from libqtile.command import lazy
from libqtile.config import Click, Drag, Match 
from libqtile.config import Screen, Key, Group, ScratchPad, DropDown
from libqtile.lazy import lazy

terminal = "kitty"

class Colorscheme:
    fg = "#F2F3D9"
    bg = "#1b252b"
    one = "#DB9CE3"
    two = "#cfc9c2"
    green = "#9ece6a"
    twoAlt = "#7aa2f7" 
    five = "#565f89" 
    three = "#414868" 
    four = "#24283b"
    red = '#ff1f2c'
    lightergreen= "#2cf49b" 

###############################
### Groups
###############################

g1 = Group(" 1", position=1)
g2 = Group(" 2", layout="VerticalTile", position=2, spawn="kitty")
g3 = Group(" 3", layout="VerticalTile", position=3, spawn="obsidian") 
g4 = Group(" 4")
g5 = Group(" 5")

groups = [g1, g2, g3, g4, g5, 
    ScratchPad("scratchpad", 
    [DropDown("notes", "st notetaker", opacity=1.0),])
]

###############################
### KEYS
###############################
mod = "mod4"
mod2 = "mod1"

class Command:
    alt_term = "alacritty"
    browser = "firefox"
    bookmarks = "bmks"
    bpytop = "alacritty -e bpytop"
    brightness_low = "changeBrightness low"
    brightness_high = "changeBrightness Up"
    brightness_med = "changeBrightness Down"
    cmus = "alacritty -e cmus"
    code = "code"
    dmenu_launch_notes = "dmenu_launch --notes"
    dmenu_launch_docs = "dmenu_launch --search"
    dmenu_notetaker = "dmenu_notetaker"
    dmenu_run_i = "dmenu_run_i"
    dmenu_task = "dmenu_task"
    file_manager = "thunar"
    # open_with_fzf = "st open_with_fzf"
    passmenu = "passmenu"
    secondary_browser="google-chrome-stable"
    screenshot = "flameshot screen -r -p /home/ramel/Images/screenshots/"
    vim = "alacritty -e vim"
    volume_mute = "changeVolume 0"
    volume_up = "changeVolume 5%+"
    volume_down = "changeVolume 5%-"
    nvim = "st nvim"
    tex = "texstudio"

keys = [
    # DMENU F KEYS - Group 1
    Key([], "F1", lazy.spawn(Command.dmenu_task)),
    Key([], "F2", lazy.spawn(Command.dmenu_launch_notes)),
    Key([], "F3", lazy.spawn(Command.dmenu_launch_docs)),
    Key([], "F4", lazy.spawn(Command.dmenu_notetaker)),
    Key([mod], "F4", lazy.group['scratchpad'].dropdown_toggle('notes')),

    # DMENU F KEYS - Group 2
    Key([], "F5", lazy.spawn(Command.dmenu_run_i)),
    Key([], "F6", lazy.spawn(Command.bookmarks)),  
    Key([], "F7", lazy.spawn(Command.passmenu)),
    # Key([], "F8", lazy.spawn(Command.passmenu)),

    # Applications - Group 3
    Key([], "F9", lazy.spawn("obsidian")),
    # Key([], "F11", lazy.spawn(Command.bookmarks)),  
    # Key([], "F12", lazy.spawn(Command.passmenu)),


    Key([mod], "q", lazy.to_screen(0)), # right primary screen
    Key([mod], "w", lazy.to_screen(1)), # right vertical screen
    Key([mod], "e", lazy.to_screen(2)), # left vertical screen

    #Home Row (GHLJK): layouts and resizing
    Key([mod], "g", lazy.layout.normalize()),
    Key([mod, "shift"], "g", lazy.layout.toggle_split()),
    Key([mod], "h", lazy.layout.left()),
    Key([mod], "l", lazy.layout.right()),
    Key([mod], "j", lazy.layout.down()),
    Key([mod], "k", lazy.layout.up()),
    Key([mod, "shift"], "h", lazy.layout.shuffle_left()),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right()),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down()),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up()),
    # Resizing CTRL UP, DOWN, LEFT, RIGHT & HJKL 
    Key([mod, "control"], "l",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "Right",
        lazy.layout.grow_right(),
        lazy.layout.grow(),
        lazy.layout.increase_ratio(),
        lazy.layout.delete(),
        ),
    Key([mod, "control"], "h",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "Left",
        lazy.layout.grow_left(),
        lazy.layout.shrink(),
        lazy.layout.decrease_ratio(),
        lazy.layout.add(),
        ),
    Key([mod, "control"], "k",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "Up",
        lazy.layout.grow_up(),
        lazy.layout.grow(),
        lazy.layout.decrease_nmaster(),
        ),
    Key([mod, "control"], "j",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),
    Key([mod, "control"], "Down",
        lazy.layout.grow_down(),
        lazy.layout.shrink(),
        lazy.layout.increase_nmaster(),
        ),


    Key([mod], "f", lazy.window.toggle_fullscreen()),
    # FLIP LAYOUT FOR MONADTALL/MONADWIDE
    Key([mod, "shift"], "f", lazy.layout.flip()),


    #Bottom Row (ZXCVBD): Apps and Dmenu
    Key([mod], "m", lazy.spawn(Command.dmenu_run_i)),
    Key([mod], "n", lazy.spawn(Command.dmenu_notetaker)),
    Key([mod], "z", lazy.spawn(Command.file_manager)),
    Key([mod], "x", lazy.spawn(Command.browser)),
    Key([mod, "shift"], "x", lazy.spawn(Command.secondary_browser)),  
    Key([mod], "t", lazy.spawn(Command.dmenu_task)),
    Key([mod], "c", lazy.spawn(Command.dmenu_launch_notes)),
    Key([mod], "v", lazy.spawn(Command.dmenu_launch_docs)),

    Key([mod], "Return", lazy.spawn(terminal)),
    Key([mod, "shift"], "Return", lazy.spawn(Command.alt_term)),
    Key([mod], "Tab", lazy.next_layout()),
    Key([mod], "space", lazy.window.kill()),
    Key([mod, "control"], "r", lazy.restart()),
    Key([mod, "control"], "q", lazy.shutdown()),

    ## MISC KEYS
    Key([], "Print", lazy.spawn(Command.screenshot)),

    ## VOLUME and BRIGHTNESS
    Key([], "XF86AudioRaiseVolume", lazy.spawn(Command.volume_up)),
    Key([], "XF86AudioLowerVolume", lazy.spawn(Command.volume_down)),
    Key([], "XF86AudioMute", lazy.spawn(Command.volume_mute)),
    Key([mod], "XF86AudioRaiseVolume", lazy.spawn(Command.brightness_high)),
    Key([mod], "XF86AudioLowerVolume", lazy.spawn(Command.brightness_med)),
    Key([mod], "XF86AudioMute", lazy.spawn(Command.brightness_low)),
    # Key([mod], "XF86AudioNext", lazy.spawn(Command.brightness_low)),
    # Key([mod], "XF86AudioPrev", lazy.spawn(Command.brightness_low)),
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
        border_focus=Colorscheme.red, 
        border_normal=Colorscheme.three,
        border_width=2,
        margin=5
)

layouts = [
    layout.MonadTall(**layout_defaults),
    layout.VerticalTile(**layout_defaults),
    layout.Columns(**layout_defaults),
    layout.Max(**layout_defaults),
    layout.Floating(**layout_defaults),
]

###############################
### CUSTOM WIDGETS
###############################

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
    font='jetbrains mono',
    fontsize=10,
    padding=5,
)

extension_defaults = widget_defaults.copy()

sep = widget.Sep(linewidth=1, size_percent=60, padding=5)

screens = [
        Screen(bottom=bar.Bar([
                    widget.CurrentLayoutIcon(background=Colorscheme.three),
                    widget.GroupBox(
                        highlight_method="line",
                        hide_unused=True,
                        rounded=True,
                        active=Colorscheme.lightergreen,
                        disable_drag=True, 
                        this_current_screen_border=Colorscheme.twoAlt,
                        this_screen_border=Colorscheme.twoAlt,
                        # other_current_screen_border=Colorscheme.two,
                        # other_screen_border=Colorscheme.two,
                        padding_y=5,
                        padding_x= 5,
                        margin_x=0,
                        fontsize=12
                        ),
                    widget.CurrentScreen(inactive_color=Colorscheme.lightergreen),
                    widget.TaskList(icon_size=0,
                        border=Colorscheme.three,
                        rounded=False,
                        fontsize=8,
                        highlight_method="block"),
                    widget.Spacer(), 
                    widget.Cmus(background=Colorscheme.five),
                    widget.Clock(format='%m-%d-%y %a %I:%M %p'),
                    widget.TextBox(text="", fontsize=16), 
                    Weather(background=Colorscheme.bg), 
                    widget.Spacer(), 
                    widget.Spacer(), 
                    widget.TextBox(text="", foreground=Colorscheme.fg,
                        background=Colorscheme.five, fontsize=22),
                    widget.PulseVolume(volume_app="pavucontrol",
                        foreground=Colorscheme.fg,
                        background=Colorscheme.five), 
                    widget.Systray(foreground=Colorscheme.fg, background=Colorscheme.three),
                    # widget.TextBox(text="", foreground=Colorscheme.fg,
                    #     background=Colorscheme.four, fontsize=22),
                    # widget.Net(format='{down}↓', padding=0, margin=0,foreground=Colorscheme.fg, background=Colorscheme.four), 
                    ], 20, 
                ),
            ), 
        Screen(bottom=bar.Bar([
                    widget.CurrentLayoutIcon(background=Colorscheme.three),
                    widget.GroupBox(
                        highlight_method="line",
                        hide_unused=True,
                        rounded=True,
                        active=Colorscheme.lightergreen,
                        disable_drag=True, 
                        this_current_screen_border=Colorscheme.twoAlt,
                        this_screen_border=Colorscheme.twoAlt,
                        # other_current_screen_border=Colorscheme.two,
                        # other_screen_border=Colorscheme.two,
                        padding_y=5,
                        padding_x= 5,
                        margin_x=0,
                        fontsize=18
                        ),
                    widget.CurrentScreen(inactive_color=Colorscheme.lightergreen),
                    widget.TextBox(text = 'J U S T  D O  I T'),
                    widget.Spacer(),
                    widget.Spacer(),
                    widget.WindowName(empty_group_string = 'J U S T  D O  I T'),
                    widget.Spacer(),
                    widget.TextBox(text="Three Years on a Stone | 石の上三年"),
                    ], 20, 
                    background=Colorscheme.bg
                )
            ),
        Screen(bottom=bar.Bar([
                    widget.Spacer(),
                    widget.CurrentScreen(inactive_color=Colorscheme.lightergreen),
                    widget.WindowName(),
                    widget.Spacer(),
                    ], 18, 
                    background=Colorscheme.bg
                )
            ),
]


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

kgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = True
cursor_warp = False

@hook.subscribe.startup_once
def start_once():
    os.system("aw-qt &")


floating_layout = layout.Floating(float_rules=[
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key
    Match(title='st'),  # GPG key
    Match(title='open_with_fzf'),  # GPG key
], border_focus=Colorscheme.one, border_width=1)
    

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

wmname = "QTILE"
