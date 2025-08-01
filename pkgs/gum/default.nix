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
    i686-linux = "06j8r84m0zq1sm81bww9m1gc53kz420a3h3mpvzn992lwkibszsq";
    x86_64-linux = "0yj5n7mjx54a8hg0f4ly1fyi5y6kqc6qdyqqdxglg8wmxrndpadp";
    armv6l-linux = "1sw2sap85ndj7jh3wll853vncfcxly3jvb980q22rl39k34vr3h1";
    armv7l-linux = "0wdxc5dzi3x3lk25b9nkb7smrq6smlvl2q2kn19wk5bybn81509b";
    aarch64-linux = "0jssvq602k3srnbg6agyyizc2l5dnzf5b5fpgv969kl6gdphz1q5";
    x86_64-darwin = "1c5ncy0i58fnx08iwxfykp2hhlsdy0a5nma4nr52sw4an7xsr78b";
    aarch64-darwin = "0pzh6sb3yg9f395dxxk9121fx5zflvcvzn8296mr0gn38d8a2igf";
  };

  urlMap = {
    i686-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Linux_i386.tar.gz";
    x86_64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Linux_x86_64.tar.gz";
    armv6l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Linux_armv6.tar.gz";
    armv7l-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Linux_armv7.tar.gz";
    aarch64-linux = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Linux_arm64.tar.gz";
    x86_64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Darwin_x86_64.tar.gz";
    aarch64-darwin = "https://github.com/charmbracelet/gum/releases/download/v0.16.2/gum_0.16.2_Darwin_arm64.tar.gz";
  };
  sourceRootMap = {
    i686-linux = "gum_0.16.2_Linux_i386";
    x86_64-linux = "gum_0.16.2_Linux_x86_64";
    armv6l-linux = "gum_0.16.2_Linux_armv6";
    armv7l-linux = "gum_0.16.2_Linux_armv7";
    aarch64-linux = "gum_0.16.2_Linux_arm64";
    x86_64-darwin = "gum_0.16.2_Darwin_x86_64";
    aarch64-darwin = "gum_0.16.2_Darwin_arm64";
  };
in
stdenvNoCC.mkDerivation {
  pname = "gum";
  version = "0.16.2";
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
