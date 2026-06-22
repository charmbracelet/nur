{
  config,
  lib,
  pkgs,
  ...
}:
let
  cfg = config.programs.crush;
  charmLib = import ../../lib { inherit pkgs; };
  crushLib = import ./lib.nix { inherit lib; };

  transformedMcpServers = lib.optionalAttrs (cfg.enableMcpIntegration && config.programs.mcp.enable) (
    lib.mapAttrs (
      _: server:
      lib.hm.mcp.transformMcpServer {
        inherit server;
        extraTransforms = [ crushLib.toCrushShape ];
        mkFileRef = path: "\$(cat ${path})";
      }
    ) config.programs.mcp.servers
  );
in
{
  options =
    let
      base = import ./options { inherit pkgs; };
    in
    base
    // {
      programs.crush = base.programs.crush // {
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
    };

  config = lib.mkIf cfg.enable {
    home = {
      packages = [ cfg.package ];
      file.".config/crush/crush.json" = lib.mkIf (cfg.settings != { }) {
        source = charmLib.toCleanJSON cfg.settings;
      };
    };
    programs.crush.settings.mcp = transformedMcpServers;
  };
}
