function setup_hm_session_vars
    if [ -n "$__SESS_VARS_SOURCED" ]
        return
    end
    set -gx __SESS_VARS_SOURCED 1

    set -gx PATH "$PATH"(test -n "$PATH" && echo ':' || echo)"$GOBIN"':'"$HOME"'/.local/bin'

    set -gx XDG_CACHE_HOME '/home/grig/.cache'
    set -gx XDG_CONFIG_HOME '/home/grig/.config'
    set -gx XDG_DATA_HOME '/home/grig/.local/share'
    set -gx XDG_STATE_HOME '/home/grig/.local/state'

    set -gx BROWSER firefox
    set -gx TERMINAL wezterm
    set -gx EDITOR hx

    set -gx CONFIG "$HOME"'/.config'
    set -gx EXTMIND "$HOME"'/extended-mind'
    set -gx NIXCONF /etc/nixos
    set -gx NVIMCONF '~/.config/nvim'

    set -gx SKIM_DEFAULT_OPTIONS '--color=fg:#cdd6f4,bg:empty,matched:#89dceb,matched_bg:#1e1e2e,current:#fab387,current_bg:#313244,current_match:#1e1e2e,current_match_bg:#89dceb,spinner:#a6e3a1,info:#bac2de,prompt:#cdd6f4,cursor:#fab387,selected:#eba0ac,header:#94e2d5,border:#6c7086 --bind \'ctrl-q:abort\''

    set -gx XCURSOR_PATH "$XCURSOR_PATH"(test -n "$XCURSOR_PATH" && echo ':' || echo)'/etc/profiles/per-user/grig/share/icons'
    set -gx XCURSOR_SIZE 16
    set -gx XCURSOR_THEME Bibata-Modern-Ice
end
setup_hm_session_vars

status is-interactive; and begin
    abbr -a gc 'cd $HOME/.config'
    abbr -a gd 'cd $HOME/.config/dotfiles'
    abbr -a gn 'cd $HOME/.config/nvim'
    abbr -a gs 'cd $HOME/sources'
    abbr -a gm 'cd $HOME/media'
    abbr -a gx 'cd $NIXCONF'

    abbr -a stw 'stow --dotfiles --no-folding -t $HOME -d $HOME/.config -S dotfiles'
    abbr -a tlm 'tmuxp load -y main'

    abbr -a gmt 'go mod tidy'
    abbr -a gmi 'go mod init'

    bind \cq exit
    bind \cl 'clear; commandline -f repaint'
    bind \cr 'run; commandline -f repaint'

    function lfcd
        cd $(lf -print-last-dir)
    end

    bind \cl 'lfcd; commandline -f execute'
end
