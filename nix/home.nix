{pkgs, ...}: {
  home.packages = with pkgs; [
    nil
    alejandra
    marksman
  ];

  programs.home-manager.enable = true;

  home = {
    username = "grig";
    homeDirectory = "/home/grig";
    stateVersion = "24.11";
  };
}
