{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Nix 本体（デーモンと /etc/nix/nix.conf）は nix-installer が管理している。
  nix.enable = false;

  # /etc/zshrc などを nix-darwin に書き換えさせない。シェルは home-manager の programs.zsh が持つ。
  programs.zsh.enable = false;
  programs.bash.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  homebrew = {
    enable = true;
    casks = [
      "1password-cli"
      "db-browser-for-sqlite"
      "entireio/tap/entire"
      "font-fira-code"
      "font-hackgen-nerd"
      "font-m-plus-1-code"
      "font-meslo-lg-nerd-font"
      "font-monaspace"
      "font-moralerspace-jpdoc"
      "font-plemol-jp-nf"
      "font-source-han-code-jp"
      "font-udev-gothic-nf"
      "ghostty"
      "miniconda"
      "sf-symbols"
      "warp"
      "wezterm@nightly"
    ];
  };

  system.defaults = {
    dock = {
      autohide = true;
      tilesize = 16;
      show-recents = true;
      mru-spaces = false;
    };
    NSGlobalDomain = {
      _HIHideMenuBar = true;
      KeyRepeat = 2;
      InitialKeyRepeat = 15;
      ApplePressAndHoldEnabled = false;
    };
  };

  system.primaryUser = "shimonlil";
  system.stateVersion = 7;
}
