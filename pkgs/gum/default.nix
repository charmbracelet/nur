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
    i686-linux = "0aajpf3jyj6zh78g8pxvs51r4pz82minv4xzw39i3x18053sgr10";
    x86_64-linux = "0zqfcxncbxypffal9w3cq65gv3yrg349lzagsxwkgc7dzm3b8znl";
    armv7l-linux = "1mzvn36w874af6x162wkb4c38bp5ywzsz9hm66vd01zlmxxq7lhh";
    aarch64-linux = "08j7m6vj1ahzr1qzcvqii0z7791d4rrbz0b93j1z38pgn3hvbivv";
    x86_64-darwin = "0lyf8yc1a39rwh45fl2y6653cqvrvl6asvk722xjfg884xhfpjbx";
    aarch64-darwin = "1ympmvwbbqdhy153sp09hfxya9pqjb3fdwi6wmr36z3h0ryxsx13";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/gum/releases/download/v0.13.0/gum_0.13.0_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.13.0/gum_0.13.0_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.13.0/gum_0.13.0_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.13.0/gum_0.13.0_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.13.0/gum_0.13.0_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.13.0/gum_0.13.0_Darwin_arm64.tar.gz";
  };
in
pkgs.stdenv.mkDerivation {
  pname = "gum";
  version = "0.13.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

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
      "armv7l-linux"
      "i686-linux"
      "x86_64-darwin"
      "x86_64-linux"
    ];
  };
}
