# Used by ad-hoc `nix-shell` / channel invocations that don't go through the
# flake. Symlinked into ~/.config/nixpkgs by home.nix so allowUnfree is honored
# outside flake context too.
{
  allowUnfree = true;
}
