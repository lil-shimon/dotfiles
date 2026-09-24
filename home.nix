{ pkgs, ... }:
{
  home.username = "shimonlil";
  home.homeDirectory = "/Users/shimonlil";
  home.stateVersion = "26.11";

  home.packages = [
    pkgs.ripgrep
  ];

  programs.home-manager.enable = true;
}
