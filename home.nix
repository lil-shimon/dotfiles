{
  config,
  lib,
  pkgs,
  ...
}:
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
    pkgs.herdr
  ];

  home.file.".gitconfig".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/git/.gitconfig";

  home.file.".wezterm.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm/.wezterm.lua";

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";

  xdg.configFile."aerospace/aerospace.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/aerospace/.aerospace.toml";

  xdg.configFile."herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/herdr/config.toml";

  home.file.".claude/hooks/herdr-agent-name.sh".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/herdr/hooks/herdr-agent-name.sh";

  home.file.".claude/skills/herdr".source = pkgs.runCommand "herdr-skill" { } ''
    test -f ${pkgs.herdr.src}/skills/herdr/SKILL.md \
      || { echo "skills/herdr/SKILL.md not found in herdr src" >&2; exit 1; }
    cp -r ${pkgs.herdr.src}/skills/herdr $out
  '';

  home.activation.herdrReviewr = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if [ ! -d "${config.xdg.configHome}/herdr/plugins/config/persiyanov.reviewr" ]; then
      run ${pkgs.herdr}/bin/herdr plugin install persiyanov/herdr-reviewr --yes
    fi
  '';

  programs.home-manager.enable = true;
}
