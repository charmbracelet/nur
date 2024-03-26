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
    i686-linux = "1zqry5mvrshpisa3g37g3sz80znyglvwxsf3mk4b5lxcihzk4fc6";
    x86_64-linux = "10sivmdviwh9yildx838y4kgkyy2yyih0lkl8jxaggiwvzym86zk";
    armv7l-linux = "11830pgv7x4f4mi65kv3vf5scrbg2pvx10jxc4v0m5iws7jmnhx4";
    aarch64-linux = "1dc8laidd87v7wcd2jfs8v3fm7ly1cgh5dxr1xl8g9624b5vyp4n";
    x86_64-darwin = "01nzqygpqxh419kjg7x5j3d271dq1nvm0rwjd4l0wrkcjvmqya36";
    aarch64-darwin = "0ab6v4q00qj5cb7b35bnh8baqhdnbhm5xjy1fhcgskk1nvcl5xgs";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/freeze/releases/download/v0.1.3/freeze_0.1.3_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/freeze/releases/download/v0.1.3/freeze_0.1.3_Linux_x86_64.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/freeze/releases/download/v0.1.3/freeze_0.1.3_Linux_arm.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/freeze/releases/download/v0.1.3/freeze_0.1.3_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/freeze/releases/download/v0.1.3/freeze_0.1.3_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/freeze/releases/download/v0.1.3/freeze_0.1.3_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "freeze_0.1.3_Linux_i386";
    x86_64-linux = "freeze_0.1.3_Linux_x86_64";
    armv7l-linux = "freeze_0.1.3_Linux_arm";
    aarch64-linux = "freeze_0.1.3_Linux_arm64";
    x86_64-darwin = "freeze_0.1.3_Darwin_x86_64";
    aarch64-darwin = "freeze_0.1.3_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "freeze";
  version = "0.1.3";
  src = fetchurl {
    url = urlMap.${system};
    sha256 = shaMap.${system};
  };

  sourceRoot = sourceRootMap.${system};

  nativeBuildInputs = [ installShellFiles ];

  installPhase = ''
    mkdir -p $out/bin
    cp -vr ./freeze $out/bin/freeze
  '';

  system = system;

  meta = {
    description = "Generate images of code and terminal output.";
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
