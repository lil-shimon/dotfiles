{
  description = "tree-sitter CLI pinned to 0.26.11";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/c27cdad491a991b11ed731760aa2ef8db0cb0410";
  };

  outputs =
    { self, nixpkgs }:
    let
      system = "aarch64-darwin";
      pkgs = nixpkgs.legacyPackages.${system};
    in
    {
      packages.${system}.default = pkgs.tree-sitter;
    };
}
