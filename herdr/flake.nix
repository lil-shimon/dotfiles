{
  description = "herdr";

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
      packages.${system} = {
        default = pkgs.herdr;

        skill = pkgs.runCommand "herdr-skill" { } ''
          test -f ${pkgs.herdr.src}/skills/herdr/SKILL.md \
            || { echo "skills/herdr/SKILL.md not found in herdr src" >&2; exit 1; }
          cp -r ${pkgs.herdr.src}/skills/herdr $out
        '';
      };
    };
}
