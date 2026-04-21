{ pkgs }:
let
  contents = builtins.readDir ./.;
  pkgDirs = builtins.filter (name: contents.${name} == "directory") (builtins.attrNames contents);
in
builtins.listToAttrs (map (name: {
  inherit name;
  value = pkgs.callPackage (./. + "/${name}") {};
}) pkgDirs)
