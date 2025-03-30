install-pkgs:
    cat pkgs | sed '/^#/d; /^\s*$/d' | xargs sudo xbps-install -y | sed '/already installed.$/d'

list-pkgs:
    xbps-query -m
