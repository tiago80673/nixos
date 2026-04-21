{ writeShellApplication, dconf, diffutils, gawk }:

writeShellApplication {
    name = "dconf-watch-dump";
    runtimeInputs = [ dconf diffutils gawk ];
    text = builtins.readFile ./dconf-watch-dump.sh;
}
