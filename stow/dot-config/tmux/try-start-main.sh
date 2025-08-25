#!/bin/bash

# Compact function for Ghostty init: connect to "main" tmux if unattached, else start fish
source "$HOME/.bashrc"

if tmux has-session -t main 2>/dev/null && [ "$(tmux list-sessions -F "#{session_name} #{session_attached}" | awk '/^main / {print $2}')" -eq 0 ]; then
    tmux attach-session -t main
elif ! tmux has-session -t main 2>/dev/null; then
    tmux new-session -s main
else
    exec fish
fi
