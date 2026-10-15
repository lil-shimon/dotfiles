{
  config,
  lib,
  pkgs,
  ...
}:
let
  logDailySync = pkgs.writeShellApplication {
    name = "log-daily-sync";
    runtimeInputs = [ pkgs.git ];
    text = ''
      cd "${config.home.homeDirectory}/src/github.com/lil-shimon/log"

      if [ "$(git branch --show-current)" != "master" ]; then
        echo "log-daily-sync: master 以外のブランチなのでスキップした" >&2
        exit 0
      fi

      if [ -n "$(git status --porcelain -- log/daily)" ]; then
        git add -- log/daily
        git commit -q -m "日記を自動保存 ($(TZ=Asia/Tokyo date '+%Y-%m-%d %H:%M'))" -- log/daily
      fi

      git fetch -q origin master
      if [ "$(git rev-list --count HEAD..origin/master)" -gt 0 ]; then
        git pull -q --rebase --autostash origin master || {
          git rebase --abort 2>/dev/null || true
          echo "log-daily-sync: rebase に失敗した" >&2
          exit 1
        }
      fi

      if [ "$(git rev-list --count origin/master..HEAD)" -gt 0 ]; then
        git push -q origin master
      fi
    '';
  };
in
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
    pkgs.aerospace
    logDailySync
  ];

  home.file.".gitconfig".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/git/.gitconfig";

  home.file.".wezterm.lua".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/wezterm/.wezterm.lua";

  xdg.configFile."nvim".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/nvim";

  xdg.configFile."aerospace/aerospace.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/aerospace/.aerospace.toml";

  xdg.configFile."mise/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/mise/config.toml";

  xdg.configFile."herdr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/herdr/config.toml";

  home.file.".claude/hooks/herdr-agent-name.sh".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/herdr/hooks/herdr-agent-name.sh";

  home.file.".claude/skills/herdr".source = pkgs.runCommand "herdr-skill" { } ''
    test -f ${pkgs.herdr.src}/skills/herdr/SKILL.md \
      || { echo "skills/herdr/SKILL.md not found in herdr src" >&2; exit 1; }
    cp -r ${pkgs.herdr.src}/skills/herdr $out
  '';

  xdg.configFile."herdr/plugins/config/persiyanov.reviewr/config.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/herdr/reviewr/config.toml";

  home.activation.herdrReviewr = lib.hm.dag.entryAfter [ "writeBoundary" ] ''
    if ! ls -d "${config.xdg.configHome}"/herdr/plugins/github/persiyanov.reviewr-* >/dev/null 2>&1; then
      run ${pkgs.herdr}/bin/herdr plugin install persiyanov/herdr-reviewr --yes
    fi
  '';

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
        /etc/profiles/per-user/$USER/bin
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
      (lib.mkOrder 750 ''
        [[ -f "$HOME/.secrets" ]] && source "$HOME/.secrets"
      '')
      ''
        [ -s "$HOME/.bun/_bun" ] && source "$HOME/.bun/_bun"

        command -v zoxide > /dev/null && eval "$(zoxide init zsh)"

        # macOS の既定は soft 256（launchctl limit maxfiles）。
        ulimit -n 10240
      ''
      (lib.mkAfter ''
        [[ -f ~/.zshrc.local ]] && source ~/.zshrc.local
      '')
    ];
  };

  programs.starship.enable = true;

  xdg.configFile."starship.toml".source =
    config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/starship/starship.toml";

  programs.home-manager.enable = true;
}
