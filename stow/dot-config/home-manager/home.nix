{ config, pkgs, ... }:
{
  home.username = "grig";
  home.homeDirectory = "/home/grig";

  home.packages = with pkgs; [
    nixfmt

    nodejs_24
    vscode-langservers-extracted
    tailwindcss-language-server

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

    ocaml
    opam
    dune
    ocamlformat
    ocamlPackages.odoc
    ocamlPackages.utop
    ocamlPackages.ocaml-lsp
    ocamlPackages.findlib
  ];

  programs.home-manager.enable = true;
  home.stateVersion = "25.11";
}
