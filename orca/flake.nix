{
  description = "orca";

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
      packages.${system}.default = pkgs.stdenvNoCC.mkDerivation (finalAttrs: {
        pname = "orca";
        version = "1.4.209";

        src = pkgs.fetchurl {
          url = "https://github.com/stablyai/orca/releases/download/v${finalAttrs.version}/Orca-${finalAttrs.version}-arm64-mac.zip";
          hash = "sha256-fAqTMSM2qAcIkzvvm3vnJvx7LLFOSh+DJB7cCgCqDP8=";
        };

        nativeBuildInputs = [ pkgs.unzip ];
        sourceRoot = ".";

        installPhase = ''
          runHook preInstall

          mkdir -p $out/Applications
          cp -R Orca.app $out/Applications/

          # Contents/Resources/bin/orca は BASH_SOURCE の symlink を辿って
          # .app のパスを決めるので、実体ではなく symlink を張る。
          mkdir -p $out/bin
          ln -s $out/Applications/Orca.app/Contents/Resources/bin/orca $out/bin/orca

          runHook postInstall
        '';

        # 公式リリースの署名済み .app をそのまま置く。fixup の strip / 再署名が
        # 走ると Developer ID 署名が壊れ、hardened runtime のアプリが起動しない。
        dontFixup = true;

        meta = {
          description = "ADE for working with a fleet of parallel agents";
          homepage = "https://www.onorca.dev/";
          license = pkgs.lib.licenses.mit;
          sourceProvenance = [ pkgs.lib.sourceTypes.binaryNativeCode ];
          platforms = [ "aarch64-darwin" ];
          mainProgram = "orca";
        };
      });
    };
}
