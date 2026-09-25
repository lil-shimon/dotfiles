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
    pkgs.wezterm
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

  home.file.".p10k.zsh".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/zsh/.p10k.zsh";

  programs.zsh = {
    enable = true;
    # ログインシェルの /bin/zsh をそのまま使う。
    package = null;

    history = {
      size = 50000;
      save = 10000;
      append = true;
      extended = true;
      expireDuplicatesFirst = true;
    };

    autosuggestion.enable = true;

    oh-my-zsh = {
      enable = true;
      plugins = [ "git" ];
    };

    shellAliases = {
      poh = "git push origin HEAD";
      sts = "git status";
      cc = "claude";
      vi = "nvim";
    };

    profileExtra = ''
      eval "$(/opt/homebrew/bin/brew shellenv)"

      export BUN_INSTALL="$HOME/.bun"

      typeset -U path
      path=(
        $HOME/.nix-profile/bin
        $HOME/.composer/vendor/bin
        /opt/homebrew/opt/ruby/bin
        $HOME/.local/bin
        $BUN_INSTALL/bin
        $HOME/.local/share/mise/shims
        $path
        $HOME/go/bin
      )
    '';

    initContent = lib.mkMerge [
      (lib.mkBefore ''
        if [[ -r "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh" ]]; then
          source "''${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-''${(%):-%n}.zsh"
        fi
      '')
      (lib.mkOrder 750 ''
        [[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"
      '')
      ''
        source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme

        [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

        command -v zoxide > /dev/null && eval "$(zoxide init zsh)"

        [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

        # macOS の既定は soft 256（launchctl limit maxfiles）。
        ulimit -n 10240
      ''
      (lib.mkAfter ''
        [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
      '')
    ];
  };

  programs.home-manager.enable = true;
}
