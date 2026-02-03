function tmux_session_switch
    set -l session (tmux list-sessions -F "#{session_name}" 2>/dev/null | \
      sk --preview 'tmux capture-pane -t {1} -p' \
         --preview-window=right:60% \
         --bind 'ctrl-q:execute(tmux kill-session -t {1})+reload(tmux list-sessions -F "#{session_name}")' \
         --bind 'ctrl-r:execute(tmux rename-session -t {1} $(read -P "New name: ") && tmux list-sessions -F "#{session_name}")+reload(tmux list-sessions -F "#{session_name}")' \
         --header "<C-Q> - kill session")
    
    if test -n "$session"
        tmux switch-client -t "$session"
    end
end
