# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repo is

NixOS system configuration for the `piupiu` host, managed as a flake. It uses Home Manager (as a NixOS module) for user-space config and NixVim for Neovim.

## Applying changes

```bash
# Rebuild and switch (aliases defined in configuration.nix)
rbn          # nh os switch (preferred — prettier output, uses nh)
rb           # sudo nixos-rebuild switch --sudo (fallback)
```

Both aliases assume the flake is at `/home/tiagoc/nixos` (hardcoded in `programs.nh.flake`).

## Formatting

```bash
nix fmt      # runs nixfmt-rfc-style (configured as flake formatter)
```

## Repository layout

| Path | Purpose |
|---|---|
| `flake.nix` | Inputs, overlays, and `nixosConfigurations.piupiu` |
| `configuration.nix` | System-level config (boot, networking, services, system packages) |
| `hardware-configuration.nix` | Auto-generated hardware config — do not hand-edit |
| `modules/workstation/` | Workstation-specific NixOS + HM modules |
| `modules/workstation/home.nix` | HM entry point; imports nixvim, firefox, gnome, zsh, hyprland, kitty |
| `modules/workstation/nixvim/` | NixVim (Neovim) configuration via Home Manager |
| `modules/graphical/` | Graphical environment modules (fonts, etc.) |
| `pkgs/` | Custom packages exposed as flake outputs and via `overlay-myPkgs` |
| `specialisations.nix` | NixOS specialisations for lid-close behaviour (currently commented out) |

## Key architectural points

**Overlays:** Two overlays are applied globally:
- `overlay-unstable` — exposes `pkgs.unstable` (nixpkgs-unstable channel)
- `overlay-myPkgs` — auto-imports every directory under `pkgs/` as a package

Use `pkgs.unstable.<name>` to pull packages from unstable without switching the whole system.

**Flake inputs:** `nixpkgs` tracks `nixos-26.05`; `nixpkgs-unstable` is available as an overlay. `nixpkgs-for-stremio` is pinned to `release-24.11` specifically to get prebuilt qt5 binaries from Hydra (qt5 was marked insecure in later releases).

**NUR:** NUR (Nix User Repository) is available — the NUR overlay is applied via `nur.modules.nixos.default`.

**Home Manager:** Configured as a NixOS module (`useGlobalPkgs = true`, `useUserPackages = true`). The HM entry for user `tiagoc` lives in `modules/workstation/home.nix`.

**NixVim:** Managed through Home Manager using `inputs.nixvim.homeModules.nixvim`. Config is split across `modules/workstation/nixvim/` with subdirectories for plugins, keymaps, options, etc.

**Specialisations:** `specialisations.nix` defines lid-suspend behaviour variants. Activate with `sudo /run/current-system/specialisation/<name>/activate`; revert with `sudo /run/booted-system/activate`.

## Commit style

Conventional commits (`.gitmessage` is set as the commit template):
```
type(scope): description   # ≤72 chars
```
Common types: `feat`, `fix`, `chore`, `refactor`. Common scopes: `nixvim`, `hm` (home-manager), `flake`.
