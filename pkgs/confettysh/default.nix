# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
}:
let
  shaMap = {
    i686-linux = "17ispz81zm6jab1fg1hipn30fairbwc4rwmi6295i1xyjdskikvk";
    x86_64-linux = "1cz49igkfmxngy0j8qcrjqgf481nciah1i8wb52s39kvwfp9w4k0";
    armv7l-linux = "0zhkxavizx5xyp808n205fy8jla982l6np8x6v2i9p0x9z05c4ma";
    aarch64-linux = "09rqggaqpqs2acc9xg5h2z000ixs9czsj2firpzfxsm1c6s9nfzp";
    x86_64-darwin = "1b2zwhfn39p2gj1qg5l5gcs2qvl5rbqh2i1l0dzka3lsxgih1g8d";
    aarch64-darwin = "040c02vz0zh3j9cykbxxhkpvard26scppf9ccdzs2d1ijfaqscmj";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/confettysh/releases/download/v1.1.2/confettysh_1.1.2_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/confettysh/releases/download/v1.1.2/confettysh_1.1.2_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/confettysh/releases/download/v1.1.2/confettysh_1.1.2_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/confettysh/releases/download/v1.1.2/confettysh_1.1.2_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/confettysh/releases/download/v1.1.2/confettysh_1.1.2_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/confettysh/releases/download/v1.1.2/confettysh_1.1.2_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "confettysh_1.1.2_Linux_i386";
    x86_64-linux = "confettysh_1.1.2_Linux_x86_64";
    armv7l-linux = "confettysh_1.1.2_Linux_arm";
    aarch64-linux = "confettysh_1.1.2_Linux_arm64";
    x86_64-darwin = "confettysh_1.1.2_Darwin_x86_64";
    aarch64-darwin = "confettysh_1.1.2_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "confettysh";
  version = "1.1.2";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./confettysh $out/bin/confettysh
  '';

  system = system;

  meta = {
    description = "Confetty over SSH";
    homepage = "https://charm.sh/";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
