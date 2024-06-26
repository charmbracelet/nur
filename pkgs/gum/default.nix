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
    i686-linux = "1gwdayhdkidzk40s5xak2350lc0sr6vk05wiwgb85sfhwvvjvkyb";
    x86_64-linux = "17qarjv676amz1s4d1la15dr3gas0swxrzdaaspabid5amspw9kv";
    armv6l-linux = "0662jd3x830mbya6d2f0ajzgvwwyiv8sdakxa4qi7wdpnv4sjglk";
    armv7l-linux = "1qq6pkfljsi6m3qfyc79hzkvyvz9n6cybmy28nxhrnspxmcn5cjk";
    aarch64-linux = "0cqrwsngwlfkbv5qx991lcmv7dqh24j5z80ks1icjaypb482y8i1";
    x86_64-darwin = "022s7icrmpvk12y4pbx72gwky7pnwq7qn02rhv2r7l3s2p8wm7zq";
    aarch64-darwin = "01phqbmxxx4q63vbv2ns0nvd02cwmpdpkdr7ss3xr2w1rfz9jz31";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Linux_x86_64.tar.gz";
    armv6l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Linux_armv6.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.14.1/gum_0.14.1_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "gum_0.14.1_Linux_i386";
    x86_64-linux = "gum_0.14.1_Linux_x86_64";
    armv6l-linux = "gum_0.14.1_Linux_armv6";
    armv7l-linux = "gum_0.14.1_Linux_armv7";
    aarch64-linux = "gum_0.14.1_Linux_arm64";
    x86_64-darwin = "gum_0.14.1_Darwin_x86_64";
    aarch64-darwin = "gum_0.14.1_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "gum";
  version = "0.14.1";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./gum $out/bin/gum
    installManPage ./manpages/gum.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "A tool for glamorous shell scripts";
    homepage = "https://charm.sh/";
    license = lib.licenses.mit;

    sourceProvenance = [ lib.sourceTypes.binaryNativeCode ];

    platforms = [
      "aarch64-darwin"
      "aarch64-linux"
      "armv6l-linux"
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
