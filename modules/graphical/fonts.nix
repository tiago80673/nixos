{pkgs, ...}:
{
    fonts.packages = with pkgs; [
	nerdfonts

    ];

    #fonts.fontconfig.enable = true; # try and make nvim detect correct font
    #console.packages = [pkgs.nerdfonts];
}
