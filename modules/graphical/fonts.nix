{pkgs, ...}:
{
    fonts.packages = with pkgs; [
	nerd-fonts.noto

    ];

    #fonts.fontconfig.enable = true; # try and make nvim detect correct font
    #console.packages = [pkgs.nerdfonts];
}
