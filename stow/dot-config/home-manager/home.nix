{ config, pkgs, ... }:
{
  home.username = "grig";
  home.homeDirectory = "/home/grig";

  home.packages = with pkgs; [
    nixfmt

    marksman # makrdown lsp
    taplo # toml lsp
    yaml-language-server # yaml lsp

    stylua

    go
    gopls

    pyright
    ruff

    gleam
    erlang

    opam
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
