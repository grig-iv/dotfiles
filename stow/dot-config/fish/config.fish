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
    bind \cH backward-kill-bigword

    # shortcuts
    abbr -a gg 'cd "$(cat $HOME/.config/bookmarks/dirs | sk | sed \'s/\~/\/home\/grig/g\')"'
    abbr -a ga 'cd $HOME/ansible/'
    abbr -a gh 'cd $HOME'
    abbr -a gc 'cd $CONFIG'
    abbr -a gd 'cd $CONFIG/dotfiles'
    abbr -a gdt 'cd $HOME/darktable/'
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

    # apt
    abbr -a ai 'sudo apt install -y'
    abbr -a ar 'sudo apt remove'
    abbr -a as 'apt-cache search'

    # pacman
    abbr -a pi 'sudo pacman -S --noconfirm'
    abbr -a pr 'sudo pacman -Rs'
    abbr -a pf 'pacman -Ss'  # [f]ind

    # ansible
    abbr -a ap "ansible-playbook"

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
    abbr -a tmx-pi 'ssh grig@192.168.1.117 -t tmux new -A -s main'
    abbr -a tree 'tree --gitignore'

    bind \cg 'lazygit'
    bind \cj "just --list | tail -n +2 | sed 's/^ *//' | sk | xargs just"

    # wsl
    if string match -q "*microsoft*" (cat /proc/version 2>/dev/null)
        abbr -a gw 'cd /mnt/c/Users/grig'
        abbr -a gwd 'cd /mnt/c/Users/grig/Downloads'
        abbr -a gws 'cd /mnt/c/Users/grig/source'

        abbr -a pwsh 'powershell.exe'
        abbr -a pwshc 'powershell.exe -C'
    end

    # extra 
    if test -e "$CONFIG/fish/config_extra.fish"
        source "$CONFIG/fish/config_extra.fish"
    end
end
