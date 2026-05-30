import subprocess
import json

def set_lang(lang_idx):
    subprocess.Popen(["niri", "msg", "action", "switch-layout", str(lang_idx)])

EN = 0
RU = 1

app_id_to_defualt_lang = {
    "com.mitchellh.ghostty": EN,
    "org.telegram.desktop": RU,
}

win_id_to_lang = dict()

curr_win_id = None

niri_events = subprocess.Popen(
    ["niri", "msg", "--json", "event-stream"],
    stdout=subprocess.PIPE,
    text=True,
)

assert niri_events.stdout

for line in niri_events.stdout:
    event = json.loads(line)
    if "KeyboardLayoutSwitched" in event:
        if curr_win_id is None: 
            continue
        lang = event["KeyboardLayoutSwitched"]["idx"]
        win_id_to_lang[curr_win_id] = lang 
    if "WindowClosed" in event:
        win_id = event["WindowClosed"]["id"]
        win_id_to_lang.pop(win_id, None)
    if "WindowFocusChanged" in event:
        win_id = event["WindowFocusChanged"]["id"]
        curr_win_id = win_id
        win_lang = win_id_to_lang.get(win_id, EN)
        set_lang(win_lang)
    if "WindowOpenedOrChanged" in event:
        win_id = event["WindowOpenedOrChanged"]["window"]["id"]
        if win_id in win_id_to_lang:
            continue

        is_focused = event["WindowOpenedOrChanged"]["window"]["is_focused"]
        if not is_focused:
            continue

        curr_win_id = win_id

        app_id = event["WindowOpenedOrChanged"]["window"]["app_id"]
        app_lang = app_id_to_defualt_lang.get(app_id, EN)
        win_id_to_lang[win_id] = app_lang

        set_lang(app_lang)

niri_events.wait()
