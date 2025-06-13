{pkgs, ...}: {
  home.packages = with pkgs; [
    age
    fd
    skim
    jq
    tree
    bottom
    tldr
    neovim
    helix
    tmux
    tmuxp
    yazi
    glow
    ripgrep
    just
    stow
    lazygit

    shadowsocks-rust
    syncthing

    curl
    wget

    # dev
    nil
    alejandra
    marksman

    go

    # desktop-shell
    xkb-switch
    unclutter-xfixes

    # desktop
    reaper
    vital
  ];

  programs.home-manager.enable = true;

  home = {
    username = "grig";
    homeDirectory = "/home/grig";
    stateVersion = "24.11";
  };
}
