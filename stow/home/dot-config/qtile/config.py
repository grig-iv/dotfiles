from libqtile import bar, layout, qtile, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen, ScratchPad, DropDown
from libqtile.lazy import lazy

gui = "mod4"  
alt = "mod1"
ctrl = "control"
shift = "shift"

mod = gui
terminal = "ghostty"

def window_to_prev_group(qtile):
    if qtile.current_window is not None:
        prev_group = qtile.current_screen.group.get_previous_group()
        qtile.current_window.togroup(prev_group.name, switch_group=True)

def window_to_next_group(qtile):
    if qtile.current_window is not None:
        next_group = qtile.current_screen.group.get_next_group()
        qtile.current_window.togroup(next_group.name, switch_group=True)

keys = [
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on the focused window"),
    Key([mod, alt], "f", lazy.window.toggle_floating(), desc="Toggle floating on the focused window"),

    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, alt], "r", lazy.reload_config(), lazy.spawn("/home/grig/.config/mind-shift/launch.sh"), desc="Reload the config"),
    Key([mod, alt], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, ctrl, alt], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Switchign between groups
    Key([mod, ctrl], "Next", lazy.screen.next_group(), desc="Move to the group on the right"),
    Key([mod, ctrl], "Prior", lazy.screen.prev_group(), desc="Move to the group on the left"),

    Key([mod, ctrl, shift], "Next", lazy.function(window_to_next_group)),
    Key([mod, ctrl, shift], "Prior", lazy.function(window_to_prev_group)),

    # Switch between windows
    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "Next", lazy.layout.next(), desc="Move window focus to next window"),
    Key([mod], "Prior", lazy.layout.previous(), desc="Move window focus to prev window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, shift], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, shift], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, shift], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, shift], "Up", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, ctrl], "Left", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, ctrl], "Right", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, ctrl], "Down", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, ctrl], "Up", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key(
        [mod, shift],
        "Return",
        lazy.layout.toggle_split(),
        desc="Toggle between split and unsplit sides of stack",
    ),
]

groups = [
    Group(
        name="1",
        matches=[],
    ),
    Group(
        name="2",
        matches=[Match(wm_class="Firefox")],
    ),
    Group(
        name="3",
        matches=[Match(wm_class="TelegramDesktop")],
    ),
    Group(
        name="4",
        matches=[Match(wm_class="Darktable")],
    ),
    Group(
        name="5",
    ),
    Group(
        name="6",
        matches=[Match(wm_class="qBittorrent")],
    ),
]

for i in groups:
    keys.extend(
        [
            # mod + group number = switch to group
            Key(
                [mod],
                i.name,
                lazy.group[i.name].toscreen(),
                desc=f"Switch to group {i.name}",
            ),
            # mod + shift + group number = switch to & move focused window to group
            Key(
                [mod, shift],
                i.name,
                lazy.window.togroup(i.name, switch_group=True),
                desc=f"Switch to & move focused window to group {i.name}",
            ),
        ]
    )

def centerDropDown(width, height):
    return {
        "x": (1-width) / 2,
        "y": (1-height) / 2,
        "width": width,
        "height": height,
    }

groups.append(ScratchPad("scratchpad", [
        DropDown("tmux-mind", f"{terminal} -e tmuxp load -y mind", 
                 on_focus_lost_hide=True, **centerDropDown(0.5, 0.95)),
        DropDown("tmux-scratchpad", f"{terminal} -e tmux new -As scratchpad", 
                 on_focus_lost_hide=True, **centerDropDown(0.5, 0.5)),
    ]))

keys.extend([
  Key([mod], 't', lazy.group['scratchpad'].dropdown_toggle('tmux-scratchpad')),
  Key([mod], 'm', lazy.group['scratchpad'].dropdown_toggle('tmux-mind')),
])

layout_theme = {"margin_on_single": 12,
                "single_margin": 12,
                "margin": 12,
                "border_width": 1,
                "single_border_width": 0,
                "border_focus": "#89dceb", 
                "border_normal": "#1e1e2e",
                }

layouts = [
    layout.Bsp(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Max(**layout_theme),
    # layout.Stack(**layout_theme),
    # layout.Matrix(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadThreeCol(**layout_theme),
    # layout.MonadWide(**layout_theme),
    # layout.RatioTile(**layout_theme),
    # layout.Tile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Zoomy(**layout_theme),
]

widget_defaults = dict(
    font="sans",
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [Screen()]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: list
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False
follow_mouse_focus = False

floating_layout = layout.Floating(
    border_focus="#fab387",
    border_width=2,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="dialog"),         # dialog boxes
        Match(wm_class="download"),       # downloads
        Match(wm_class="error"),          # error msgs
        Match(wm_class="file_progress"),  # file progress boxes
        Match(wm_class="notification"),   # notifications
        Match(wm_class='pinentry-gtk-2'), # GPG key password entry
        Match(wm_class="ssh-askpass"),    # ssh-askpass
        Match(wm_class="toolbar"),        # toolbars
        Match(title="pinentry"),          # GPG key password entry
    ]
)
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True

wmname = "LG3D"
