{
  description = "neovim pinned to 0.12.5";

  inputs = {
    # neovim 0.12.5 を含む nixpkgs revision。
    # 特定には https://www.nixhub.io/packages/neovim を使う。
    # バージョンを上げる時はこの rev を差し替えて `nix flake lock` を実行する。
    nixpkgs.url = "github:NixOS/nixpkgs/c27cdad491a991b11ed731760aa2ef8db0cb0410";
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
