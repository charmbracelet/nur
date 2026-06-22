{ pkgs }:
let
  crushLib = import ../../modules/crush/lib.nix { lib = pkgs.lib; };
  got = crushLib.mcpOptionNames;

  isList = builtins.isList got;
  allStrings = pkgs.lib.all (v: builtins.isString v) got;
  noDuplicates = pkgs.lib.length (pkgs.lib.unique got) == pkgs.lib.length got;
  allNonEmpty = pkgs.lib.all (s: builtins.stringLength s > 0) got;
  ok = isList && allStrings && noDuplicates && allNonEmpty;
  report = pkgs.writeText "crush-lib-test.json" (
    builtins.toJSON {
      inherit
        isList
        allStrings
        noDuplicates
        allNonEmpty
        ok
        got
        ;
    }
  );
in
pkgs.runCommand "crush-lib-test" { } ''
  ${pkgs.jq}/bin/jq -e '.ok == true' < ${report} > /dev/null
  ${pkgs.jq}/bin/jq . < ${report}
  touch $out
''
