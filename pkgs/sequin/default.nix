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
    i686-linux = "08cwc5yh5py848cdird7f7chp8qqdiln4p18fvfmyvpdx671a30n";
    x86_64-linux = "0l91qvw473r5bvmwyqmcw068p5m3r04657jljyyqlazg18a6rywq";
    armv7l-linux = "0g5iixislld20vzbjpph8nshf36hb12ajxxail96yjk1b8blafg5";
    aarch64-linux = "13509xidmj20i4ndkkffxr5gym921fpj5xv9qmy5ly40nsrm9k5j";
    x86_64-darwin = "1f0gayi696j5za9vwv1kw3dws73hmiqca40r2zyi29gcxffx8s55";
    aarch64-darwin = "1llig13bk0ib5zgjrrx9ryqnaqcga88qijw43kmrxnxfq35ygc0b";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/sequin/releases/download/v0.1.0/sequin_0.1.0_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/sequin/releases/download/v0.1.0/sequin_0.1.0_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/sequin/releases/download/v0.1.0/sequin_0.1.0_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/sequin/releases/download/v0.1.0/sequin_0.1.0_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/sequin/releases/download/v0.1.0/sequin_0.1.0_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/sequin/releases/download/v0.1.0/sequin_0.1.0_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "sequin_0.1.0_Linux_i386";
    x86_64-linux = "sequin_0.1.0_Linux_x86_64";
    armv7l-linux = "sequin_0.1.0_Linux_arm";
    aarch64-linux = "sequin_0.1.0_Linux_arm64";
    x86_64-darwin = "sequin_0.1.0_Darwin_x86_64";
    aarch64-darwin = "sequin_0.1.0_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "sequin";
  version = "0.1.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./sequin $out/bin/sequin
  '';

  system = system;

  meta = {
    description = "Human-readable ANSI sequences.";
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
