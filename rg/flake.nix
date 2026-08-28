{
  description = "ripgrep pinned to 15.1.0";

  inputs = {
    # ripgrep 15.1.0 を含む nixpkgs revision。
    # 特定には https://www.nixhub.io/packages/ripgrep を使う。
    # バージョンを上げる時はこの rev を差し替えて `nix flake lock` を実行する。
    nixpkgs.url = "github:NixOS/nixpkgs/389ed85304b281ca7f306cf8a1eb4378651ca44e";
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
