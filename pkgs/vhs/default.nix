# This file was generated by GoReleaser. DO NOT EDIT.
# vim: set ft=nix ts=2 sw=2 sts=2 et sta
{
system ? builtins.currentSystem
, lib
, fetchurl
, installShellFiles
, stdenvNoCC
, ffmpeg
, ttyd
, chromium
, makeWrapper
}:
let
  shaMap = {
    i686-linux = "08faygvs61qxwrf1naxdr6b81kfhf1pa6m5m99h34rpy0b6ag94c";
    x86_64-linux = "01sl2agmqxr8wx12dlqa821vgdyf5przwg2kzv51s46a1a3w6lmm";
    armv7l-linux = "1zfdapl7a47q7j5qxk6ri5xczvlhf76pcd9q7qkgbhpss57r6rmx";
    aarch64-linux = "19sjcr5m146xhnlzrihcaqpf3wa03m0wy1aa03fbjha6il100wvd";
    x86_64-darwin = "0w0bmnjydm2rlvm34g5y0nkb1paclisx6dx798h3gj4x74gsxw8f";
    aarch64-darwin = "04l0c7dfj8ymg5gp0z5j6m7h4f0s4krhwgan4fk8pb056d06q9fw";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/vhs/releases/download/v0.10.0/vhs_0.10.0_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/vhs/releases/download/v0.10.0/vhs_0.10.0_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/vhs/releases/download/v0.10.0/vhs_0.10.0_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/vhs/releases/download/v0.10.0/vhs_0.10.0_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/vhs/releases/download/v0.10.0/vhs_0.10.0_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/vhs/releases/download/v0.10.0/vhs_0.10.0_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "vhs_0.10.0_Linux_i386";
    x86_64-linux = "vhs_0.10.0_Linux_x86_64";
    armv7l-linux = "vhs_0.10.0_Linux_arm";
    aarch64-linux = "vhs_0.10.0_Linux_arm64";
    x86_64-darwin = "vhs_0.10.0_Darwin_x86_64";
    aarch64-darwin = "vhs_0.10.0_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "vhs";
  version = "0.10.0";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles makeWrapper ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./vhs $out/bin/vhs
    wrapProgram $out/bin/vhs --prefix PATH : ${lib.makeBinPath (lib.optionals stdenvNoCC.isLinux [ chromium ] ++ [ ffmpeg ttyd ])}
    installManPage ./manpages/vhs.1.gz
    installShellCompletion ./completions/*
  '';

  system = system;

  meta = {
    description = "A tool for recording terminal GIFs";
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
