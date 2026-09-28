{
  lib,
  stdenvNoCC,
  fetchurl,
  unzip,
}:
stdenvNoCC.mkDerivation (finalAttrs: {
  pname = "orca";
  version = "1.4.215";

  src = fetchurl {
    url = "https://github.com/stablyai/orca/releases/download/v${finalAttrs.version}/Orca-${finalAttrs.version}-arm64-mac.zip";
    hash = "sha256-VGuf6RB+h5a4exWnccw337XG7YqtZLo7Cc5vZa2i02A=";
  };

  nativeBuildInputs = [ unzip ];
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
    license = lib.licenses.mit;
    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];
    platforms = [ "aarch64-darwin" ];
    mainProgram = "orca";
  };
})
