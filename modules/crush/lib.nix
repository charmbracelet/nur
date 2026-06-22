# Helpers for the Crush Home Manager module.
{ lib }:
let
  # Names of all options declared on the programmatically generated
  # `programs.crush.settings.mcp.<name>` submodule (i.e. the per-MCP-
  # server fields). Derived at eval time from options/settings.nix
  # so it stays in sync when `scripts/generate-crush-settings.go`
  # regenerates that file.
  mcpOptionNames =
    let
      crushSettingsModule = import ./options/settings.nix { inherit lib; };
      crushSubOptions = crushSettingsModule.type.getSubOptions [ ];
      mcpSubOptions = crushSubOptions.mcp.type.getSubOptions [ ];
    in
    lib.filter (n: n != "_module") (builtins.attrNames mcpSubOptions);
in
{
  inherit mcpOptionNames;

  # Returns a function suitable for `lib.hm.mcp.transformMcpServer`'s
  # `extraTransforms` argument. Takes a server attrset and returns a
  # new attrset containing only the fields whitelisted in
  # `mcpOptionNames` (the per-MCP-server schema derived from
  # options/settings.nix).
  toCrushShape =
    server:
    builtins.intersectAttrs (builtins.listToAttrs (
      map (n: {
        name = n;
        value = true;
      }) mcpOptionNames
    )) server;
}
