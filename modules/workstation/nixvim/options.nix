{

	programs.nixvim.opts = {
		updatetime = 100;

		number = true;
		relativenumber = true;

		spell = true;
		spelllang = ["en" "pt"];

		undofile = true;
		undodir = "/tmp//";
	
		foldlevel = 99; # open folds at startup
	};

}
