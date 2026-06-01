import json
import os
import threading

def pipe_reader(pipe_path, command_handler):
    while True:
        with open(pipe_path, "r") as fifo:
            for line in fifo:
                line = line.strip()
                if line:
                    command_handler(line)

def listen_to_pipe(pipe_path, command_handler):
    if not os.path.exists(pipe_path):
        os.mkfifo(pipe_path)

    t = threading.Thread(target=pipe_reader, args=(pipe_path, command_handler))
    t.start()

def waybar_send(text, alt=None, tooltip=None, classes=[]):
    state = {"text": text}

    if alt is not None:
        state["alt"] = alt

    if tooltip is not None:
        state["tooltip"] = tooltip

    if len(classes) > 0:
        state["classes"] = classes

    print(json.dumps(state))
