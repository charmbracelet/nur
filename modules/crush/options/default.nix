{ pkgs }:

let
  inherit (pkgs) lib;
in
{
  enable = lib.mkEnableOption "Enable crush";

  package = lib.mkOption {
    default = (pkgs.callPackage ../../../pkgs/crush { });
    defaultText = "crush";
    description = "Package to use for crush";
  };

  settings = import ./settings.nix { inherit lib; };
}
