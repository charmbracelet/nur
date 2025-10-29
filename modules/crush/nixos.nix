{
  config,
  lib,
  pkgs,
  ...
}: let
  options = import ./options.nix {inherit lib;};
in {
  inherit options;

  config = lib.mkIf config.programs.crush.enable {
    environment.systemPackages = [(pkgs.callPackage ../../pkgs/crush {})];
    environment.etc."crush/crush.json" = lib.mkIf (config.programs.crush.settings != {}) {
      text = builtins.toJSON config.programs.crush.settings;
      mode = "0644";
    };
  };
}
