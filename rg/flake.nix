{
  description = "ripgrep";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      # telescope の find_files / live_grep を rg 経路で動かすために入れている。
      # nvim/flake.nix と同居させず別 flake にしてあるのは、flake.lock を共有すると
      # neovim の rev を上げた時に ripgrep も巻き込まれ、更新の粒度が落ちるため。
      packages.${system}.default = pkgs.ripgrep;
    };
}
