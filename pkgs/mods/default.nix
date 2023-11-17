# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, pkgs
, lib
, fetchurl
, installShellFiles
}:
let
  shaMap = {
    i686-linux = "0nks1871jfgll2kk0scmlrh67f1a9m6a1624b2ws4hp4slqn6ras";
    x86_64-linux = "080l54yki8qx6qzpfx1h2s998s5dwpmc41icpq7gaicn9l9pfmag";
    armv7l-linux = "15mqb99x0dh4rskqmczyv4bhgkp657pwaqzy0vmz3ibhqyhxvgsg";
    aarch64-linux = "1vq1mq38iyc29alcrwajmrdp1bvslcs29p14a0spidw2s88i1hp9";
    x86_64-darwin = "0v3wgxvz3kgjydkaprxw38f31jhwgs01zdc0g2hch0s2i5n2vzqn";
    aarch64-darwin = "00va5mak2zwn3xkrynyf33x2xnvyxm1lrl6ihzx2rskx7flzfyax";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/mods/releases/download/v1.1.0/mods_1.1.0_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/mods/releases/download/v1.1.0/mods_1.1.0_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/mods/releases/download/v1.1.0/mods_1.1.0_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/mods/releases/download/v1.1.0/mods_1.1.0_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/mods/releases/download/v1.1.0/mods_1.1.0_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/mods/releases/download/v1.1.0/mods_1.1.0_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "mods";
  version = "1.1.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./mods $out/bin/mods
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "AI on the command line";
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
