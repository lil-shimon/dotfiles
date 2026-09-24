{ config, pkgs, ... }:
{
  home.username = "shimonlil";
  home.homeDirectory = "/Users/shimonlil";
  home.stateVersion = "26.11";

  home.packages = [
    pkgs.ripgrep
    pkgs.tree-sitter
    pkgs.git
    pkgs.gh
    pkgs.ghq
  ];

  home.file.".gitconfig".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/git/.gitconfig";

  home.file.".wezterm.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm/.wezterm.lua";

  programs.home-manager.enable = true;
}
