{
  config,
  lib,
  pkgs,
  ...
}:
let
  options = import ./options.nix {inherit pkgs;};
  cfg = config.programs.crush;
in {
  inherit options;

  config = lib.mkIf cfg.enable {
    home.packages = [ cfg.package ];
    home.file.".config/crush/crush.json" = lib.mkIf (cfg.settings != {}) {
      text = builtins.toJSON cfg.settings;
    };
  };
}
