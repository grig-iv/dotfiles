#!/bin/bash

source "$HOME/.bashrc"

if tmux has-session -t main 2>/dev/null && [ "$(tmux list-sessions -F "#{session_name} #{session_attached}" | awk '/^main / {print $2}')" -eq 0 ]; then
    tmux attach-session -t main
elif ! tmux has-session -t main 2>/dev/null; then
    # create session
    tmux new-session -d -s main

    # wait until fish panel is started
    until tmux list-panes -t main -F "#{pane_current_command}" | grep -q fish; do
        sleep 0.1
    done

    # run fastfetch
    tmux send-keys -t main "fastfetch" Enter

    # attach to session
    tmux attach-session -t main
else
    exec fish
fi
