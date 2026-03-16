import os
import threading
import time

def command_handler(line):
    print(line)

path="/tmp/timer_pipe"

if not os.path.exists(path):
    os.mkfifo(path)

while True:
    with open(path, "r") as fifo:
        for line in fifo:
            line = line.strip()
            if line:
                command_handler(line)
    time.sleep(0.1)

