{
  description = "git 2.55.0, gh 2.100.0, ghq 1.10.1";

  inputs = {
    # git / gh / ghq の上記バージョンを含む nixpkgs revision。
    # 特定には https://www.nixhub.io を使う。
    # バージョンを上げる時はこの rev を差し替えて `nix flake lock` を実行する。
    nixpkgs.url = "github:NixOS/nixpkgs/c7def046b9a883d46974757852106483d741586f";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.buildEnv {
        name = "git-tools";
        paths = [
          pkgs.git
          pkgs.gh
          pkgs.ghq
        ];
      };
    };
}
