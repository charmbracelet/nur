{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.crush;
  charmLib = import ../../lib { inherit pkgs; };
in {
  options.programs.crush = import ./options {inherit pkgs;} // {
    enableMcpIntegration = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to integrate the MCP servers config from
        {option}`programs.mcp.servers` into
        {option}`programs.crush.settings.mcp`.
      '';
    };
  };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      file.".config/crush/crush.json" = lib.mkIf (cfg.settings != {}) {
        source = charmLib.toCleanJSON cfg.settings;
      };
    };
    programs.crush.settings.mcp = lib.mkIf cfg.enableMcpIntegration config.programs.mcp.servers;
  };
}
