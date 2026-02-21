{ config, pkgs, ... }:
{
  home.username = "grig";
  home.homeDirectory = "/home/grig";

  home.packages = with pkgs; [
    nixfmt

    nodejs_24

    marksman # makrdown lsp
    taplo # toml lsp
    yaml-language-server # yaml lsp
    stylua

    go
    gopls

    rustc

    pyright
    ruff

    gleam
    erlang
    rebar3
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
