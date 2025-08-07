status is-interactive; and begin
    if type -q direnv
        direnv hook fish | source
    end

    source "$CONFIG/fish/colors.fish"

    fish_add_path "/home/grig/.cache/.bun/bin"
    fish_add_path "/home/grig/go/bin"

    # binds
    bind \cq exit
    bind \cf findAndEdit
    bind \ck killProcess
    bind \cl 'clear; commandline -f repaint'
    bind \cr 'run; commandline -f repaint'

    # shortcuts
    abbr -a gg 'cd "$(cat $HOME/.config/bookmarks/dirs | sk | sed \'s/\~/\/home\/grig/g\')"'
    abbr -a gh 'cd $HOME'
    abbr -a gc 'cd $CONFIG'
    abbr -a gd 'cd $CONFIG/dotfiles'
    abbr -a gdl 'cd $HOME/Downloads'
    abbr -a gs 'cd $HOME/sources'
    abbr -a gl 'cd $HOME/.local'
    abbr -a gls 'cd $HOME/.local/share'
    abbr -a glb 'cd $HOME/.local/bin'
    abbr -a gt 'cd $HOME/media/T7'

    abbr -a c 'jump -d $CONFIG && yacd'
    abbr -a s 'jump -d $HOME/sources/ && yacd'
    abbr -a d 'jump -d -r $CONFIG/dotfiles && yacd'
    abbr -a t 'jump -d $HOME/media/T7/torrents'

    abbr -a cp 'cp -ivr'
    abbr -a mv 'mv -iv'
    abbr -a rm 'rm -vI'
    abbr -a mkdir 'mkdir -pv'
    abbr -a bc 'bc -ql'
    abbr -a ls 'ls -la'

    abbr -a grep 'grep -i'

    # void
    abbr -a xi 'sudo xbps-install -y'
    abbr -a xr 'sudo xbps-remove -y'
    abbr -a xq 'xbps-query -Rs'

    # neovim
    abbr -a gn 'cd $CONFIG/nvim'
    abbr -a n 'jump -r $CONFIG/nvim'
    abbr -a vi 'nvim'
    abbr -a vim 'nvim'

    # go
    abbr -a gmt 'go mod tidy'
    abbr -a gmi 'go mod init'

    # notes
    abbr -a m 'cd $MIND & $EDITOR context.md'
    abbr -a gm 'cd $MIND'

    # lf
    function lfcd
        cd $(lf -print-last-dir)
    end
    bind \cl 'clear; commandline -f execute'

    # yazi
    function yacd
        set tmp (mktemp -t "yazi-cwd.XXXXX")
        yazi $argv --cwd-file="$tmp"
        if set cwd (cat -- "$tmp"); and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
            cd -- "$cwd"
        end
        rm -f -- "$tmp"
    end
    bind \ce 'yacd; commandline -f execute'

    # misc
    abbr -a stw 'stow --dotfiles --no-folding -t $HOME -d ~/.config/dotfiles/stow -S home'
    abbr -a tmx 'tmux new -A -s main'
    abbr -a tree 'tree --gitignore'
    bind \cg 'lazygit'

    bind \cj "just --list | tail -n +2 | sed 's/^ *//' | sk | xargs just"
end
