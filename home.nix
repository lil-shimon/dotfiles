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
    # wrapper 版 (pkgs.neovim) ではなく unwrapped を使う。
    # wrapper 版は python3 / ruby の provider を同梱してクロージャが肥大するうえ、
    # provider を PATH から解決する brew 版の挙動と差分が出る。
    # 設定側で provider を使っていないため、差分を最小にする unwrapped を採る。
    pkgs.neovim-unwrapped
  ];

  home.file.".gitconfig".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/git/.gitconfig";

  home.file.".wezterm.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm/.wezterm.lua";

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";

  xdg.configFile."aerospace/aerospace.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/aerospace/.aerospace.toml";

  programs.home-manager.enable = true;
}
