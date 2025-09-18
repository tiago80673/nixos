{ pkgs }:
{
  dconf-watch-dump = import ./dconf-watch-dump { inherit pkgs; };
  #TODO auto import all folders or disable this, why do I need it?
}

