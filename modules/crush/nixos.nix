{
  config,
  lib,
  pkgs,
  ...
}:
let
  options = import ./options.nix { inherit pkgs; };
  cfg = config.programs.crush;
in {
  inherit options;

  config = lib.mkIf cfg.enable {
    environment.systemPackages = [ cfg.package ];
    environment.etc."crush/crush.json" = lib.mkIf (cfg.settings != {}) {
      text = builtins.toJSON cfg.settings;
      mode = "0644";
    };
  };
}
