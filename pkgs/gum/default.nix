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
    i686-linux = "0qb5yqks7c8r4d4aj91zl97by0lc9ifafnaz3995zq4cavxhkbf2";
    x86_64-linux = "095i0dlq40csv6xcgxbxdzddnykgqjgahskv7zwh03mvf5b3wh3s";
    armv6l-linux = "1ybijajivjafw44i667pz0wds5jbm535axddn1vpqia5k098l850";
    armv7l-linux = "19cda64l4kdma9z9bm2a3m3lfpizgvgc990rw715km2lmqsdmd9a";
    aarch64-linux = "03mx27qglqm7wzak2r4ihfahpc5vfg3kjgsyp52dy9fsnllhm3n2";
    x86_64-darwin = "1n4l4xrmk89fskadvxycv5xq6qdla6q0r00gv20zys1p6wmh42c0";
    aarch64-darwin = "10xj257sf9vrn42x4qd4kw26zdz1qbamnzngbbqnc2caddzmaayc";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Linux_x86_64.tar.gz";
    armv6l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Linux_armv6.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.16.0/gum_0.16.0_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "gum_0.16.0_Linux_i386";
    x86_64-linux = "gum_0.16.0_Linux_x86_64";
    armv6l-linux = "gum_0.16.0_Linux_armv6";
    armv7l-linux = "gum_0.16.0_Linux_armv7";
    aarch64-linux = "gum_0.16.0_Linux_arm64";
    x86_64-darwin = "gum_0.16.0_Darwin_x86_64";
    aarch64-darwin = "gum_0.16.0_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "gum";
  version = "0.16.0";
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
