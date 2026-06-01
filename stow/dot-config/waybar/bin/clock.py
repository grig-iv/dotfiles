import threading
import lib 
from datetime import datetime, timedelta
import time
from enum import Enum, auto

class Mode(Enum):
    Default = auto()
    Detailed = auto()

    @property
    def next(self):
        members = list(self.__class__)
        current_index = members.index(self)
        next_index = (current_index + 1) % len(members)
        return members[next_index]

ALARM_H, ALARM_M = (9, 0)

global mode
mode = Mode.Default 

def get_clock_icon(hour, is_filled):
    if hour >= 12:
        hour = hour - 12 

    icons = []
    match hour:
        case 0: icons = ["󱑖", "󱑊"]
        case 1: icons = ["󱑋", "󱐿"]
        case 2: icons = ["󱑌", "󱑀"]
        case 3: icons = ["󱑍", "󱑁"]
        case 4: icons = ["󱑎", "󱑂"]
        case 5: icons = ["󱑏", "󱑃"]
        case 6: icons = ["󱑐", "󱑄"]
        case 7: icons = ["󱑑", "󱑅"]
        case 8: icons = ["󱑒", "󱑆"]
        case 9: icons = ["󱑓", "󱑇"]
        case 10: icons = ["󱑔", "󱑈"]
        case _: icons = ["󱑕", "󱑉"]

    return icons[1] if is_filled else icons[0]

def get_time_until_alarm():
    now = datetime.now()
    alarm = now.replace(hour=ALARM_H, minute=ALARM_M, second=0, microsecond=0) 
    if alarm < now:
        alarm += timedelta(days=1)
    return alarm - now

def show_alarm_time():
    time_until_alarm = get_time_until_alarm() 
    hours_until_alarm = time_until_alarm.seconds // 3600
    mins_until_alarm = time_until_alarm.seconds // 60 % 60

    classes = []
    if hours_until_alarm < 8:
        classes.append("critical")
    elif hours_until_alarm < 10: 
        classes.append("accent")

    lib.waybar_send(f'󰀠 {hours_until_alarm}:{mins_until_alarm:02}', classes=classes)

def show_short_time():
    now = datetime.now()
    icon = get_clock_icon(now.hour, False)
    lib.waybar_send(now.strftime(f'{icon} %H:%M'))

def show_full_time():
    now = datetime.now()
    lib.waybar_send(now.strftime("%Y • %B %d • %A • %H:%M:%S"))

def on_tick():
    if mode == Mode.Default:
        time_until_alarm = get_time_until_alarm() 
        hours_until_alarm = time_until_alarm.seconds // 3600
        if hours_until_alarm <= 12:
            show_alarm_time()
        else:
            show_short_time()
    elif mode == Mode.Detailed:
        show_full_time()

def repeating(interval, fn):
    fn()
    t = threading.Timer(interval, repeating, [interval, fn])
    t.start()
    return t

def command_handler(line):
    global mode
    match line:
        case "left-click":
            mode = mode.next
    on_tick()

lib.listen_to_pipe("/tmp/clock_pipe", command_handler)

on_tick()
now = datetime.now()
time.sleep(1 - now.microsecond / 1_000_000) # sync with seconds
repeating(1.0, on_tick)
