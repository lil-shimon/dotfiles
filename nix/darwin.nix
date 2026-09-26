{ ... }:
{
  nixpkgs.hostPlatform = "aarch64-darwin";

  # Nix 本体（デーモンと /etc/nix/nix.conf）は nix-installer が管理している。
  nix.enable = false;

  # /etc/zshrc などを nix-darwin に書き換えさせない。シェルは home-manager の programs.zsh が持つ。
  programs.zsh.enable = false;
  programs.bash.enable = false;

  security.pam.services.sudo_local.touchIdAuth = true;

  system.primaryUser = "shimonlil";
  system.stateVersion = 7;
}
