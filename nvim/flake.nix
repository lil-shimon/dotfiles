{
  description = "neovim";

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
      # wrapper 版 (pkgs.neovim) ではなく unwrapped を使う。
      # wrapper 版は python3 / ruby の provider を同梱してクロージャが肥大するうえ、
      # provider を PATH から解決する brew 版の挙動と差分が出る。
      # 設定側で provider を使っていないため、差分を最小にする unwrapped を採る。
      packages.${system}.default = pkgs.neovim-unwrapped;
    };
}
