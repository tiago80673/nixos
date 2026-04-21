{ pkgs, ... }: {
    imports = [
        ./fonts.nix
        ./hyprland.nix
    ];

    xdg.portal = { # bridge between apps and the DE
        enable = true;
        extraPortals = [ pkgs.xdg-desktop-portal-gnome ];
    };
}
