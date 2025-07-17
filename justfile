stow: remove-broken-links
    stow --dotfiles --no-folding -t $HOME -d "{{justfile_directory()}}" -S stow

[working-directory: "/home/grig/"]
remove-broken-links:
    cd $HOME
    find . -xtype l -delete
