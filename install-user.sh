#!/usr/bin/env dash

if [ ! -d "$HOME/.config/nvim" ]; then
    git clone git@github.com:grig-iv/nvim.git ~/.config/nvim
fi

if [ ! -d "$HOME/.local/src/plato" ]; then
    git clone git@github.com:grig-iv/plato.git ~/.local/src/plato
    cd ~/.local/src/plato
    just install
fi

if [ ! -d "$HOME/.local/src/win-layout" ]; then
    git clone git@github.com:grig-iv/win-layout.git ~/.local/src/win-layout
    cd ~/.local/src/win-layout
    just install
fi

if [ ! -d "$HOME/.local/src/mind-shift-st" ]; then
    git clone git@github.com:grig-iv/mind-shift-st ~/.local/src/mind-shift-st
    cd ~/.local/src/mind-shift-st
    just install-deps
    just install
fi

ln -sf "/run/media/grig" "$HOME/media"
