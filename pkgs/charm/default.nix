# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{ system ? builtins.currentSystem, pkgs, lib, fetchurl, installShellFiles }:
let
  shaMap = {
    i686-linux = "0k2nhni9k38p4pf8cbvm54msqxd1akfdlzsby5cqyncl3649mkd3";
    x86_64-linux = "1scwhprx8slz6b82iw8za0zhalkfq8634pcmf73xzw799jg2xirx";
    armv7l-linux = "0mlicnr714k26m1sai6x78wb3frqkyphjass83vq66l9kaxvfkfg";
    aarch64-linux = "123bcl615majyj22prdcagd95ny981jpm1ipsk3k1m6zspnvccbc";
    x86_64-darwin = "1z4lk8xcjclsmgwajxrws746xpa31a7blssnjfa8bmdw48rrzlzs";
    aarch64-darwin = "1vwl0fbzjqnqcjna2hn8hylc9ad56jr8lk3gzfnnph002rs1d797";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/charm/releases/download/v0.12.6/charm_0.12.6_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/charm/releases/download/v0.12.6/charm_0.12.6_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/charm/releases/download/v0.12.6/charm_0.12.6_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/charm/releases/download/v0.12.6/charm_0.12.6_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/charm/releases/download/v0.12.6/charm_0.12.6_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/charm/releases/download/v0.12.6/charm_0.12.6_Darwin_arm64.tar.gz";
  };
in pkgs.stdenv.mkDerivation {
  pname = "charm";
  version = "0.12.6";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = ".";

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./charm $out/bin/charm
    installManPage ./manpages/charm.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = with lib; {
    description = "The Charm Tool and Library 🌟";
    homepage = "https://charm.sh/";
    license = licenses.mit;

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
