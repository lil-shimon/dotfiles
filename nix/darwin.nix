{ pkgs, ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Nix 本体（デーモンと /etc/nix/nix.conf）は nix-installer が管理している。
  nix.enable = false;

  # /etc/zshrc などを nix-darwin に書き換えさせない。シェルは home-manager の programs.zsh が持つ。
  programs.zsh.enable = false;
  programs.bash.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  networking.applicationFirewall = {
    enable = true;
    enableStealthMode = true;
  };

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
      "google-chrome"
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
      "com.apple.trackpad.scaling" = 1.5;
      AppleInterfaceStyle = "Dark";
    };
    trackpad = {
      Clicking = true;
    };
    finder = {
      FXPreferredViewStyle = "Nlsv";
    };
    loginwindow = {
      GuestEnabled = false;
    };
  };

  system.activationScripts.postActivation.text = ''
    launchctl asuser "$(id -u -- lilshimon)" sudo --user=lilshimon -- defaults -currentHost write com.apple.screensaver idleTime -int 600
    launchctl asuser "$(id -u -- lilshimon)" sudo --user=lilshimon -- ${pkgs.defaultbrowser}/bin/defaultbrowser chrome
  '';

  users.users.lilshimon.home = "/Users/lilshimon";

  system.primaryUser = "lilshimon";
  system.stateVersion = 7;
  system.keyboard = {
    enableKeyMapping = true;
    remapCapsLockToControl = true;
  };
}
