source $HOME/.config/shell/env

if status is-interactive
    function lfcd
        cd $(lf -print-last-dir)
    end

    abbr -a vi 'nvim'
    abbr -a stw 'stow --dotfiles --no-folding -t $HOME -d $HOME/.config -S dotfiles'
    abbr -a hms 'home-manager switch'

    bind \ce 'lfcd; commandline -f execute'
end
