stow: remove-broken-links
    stow --dotfiles --no-folding -t $HOME -d "{{justfile_directory()}}" -S stow

[working-directory: "/home/grig/"]
remove-broken-links:
    cd $HOME
    find . -xtype l -delete

set-hostname NAME:
    sudo hostnamectl set-hostname {{NAME}}

install-nix:
    sh <(curl --proto '=https' --tlsv1.2 -L https://nixos.org/nix/install) --daemon
