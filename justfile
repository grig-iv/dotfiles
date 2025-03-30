install-pkgs:
    cat pkgs | sed '/^#/d; /^\s*$/d' | xargs sudo xbps-install -y | sed '/already installed.$/d'

list-pkgs:
    xbps-query -m

[working-directory: "/home/grig/"]
remove-broken-links:
    cd $HOME
    find . -xtype l -delete
