{
  description = "tree-sitter CLI pinned to 0.26.11";

  inputs = {
    # tree-sitter 0.26.11 を含む nixpkgs revision。
    # 特定には https://www.nixhub.io/packages/tree-sitter を使う。
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
      # nvim-treesitter の main ブランチが parser のビルドに `tree-sitter build` を呼ぶため必要。
      # main の要求は 0.26.1 以上 (:checkhealth nvim-treesitter で検証できる)。
      # nvim/flake.nix と同居させず別 flake にしてあるのは、flake.lock を共有すると
      # neovim の rev を上げた時に tree-sitter も巻き込まれ、更新の粒度が落ちるため。
      packages.${system}.default = pkgs.tree-sitter;
    };
}
