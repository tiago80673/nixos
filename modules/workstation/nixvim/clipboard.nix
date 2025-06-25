{
    programs.nixvim = {
	#clipboard.register = "unnamedplus"; # allow copy and paste directly into system clipboard without using * + registers 
	clipboard.providers.wl-copy.enable = true; # allow interacting with system clipboard through + register
    };

}
