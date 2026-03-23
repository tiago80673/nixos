{

	programs.nixvim.opts = {
		updatetime = 100;

		number = true;
		relativenumber = true;

		spell = false; #pretty annoying
		spelllang = ["en" "pt"];

		undofile = true;
		undodir = "/tmp//";
	
		foldlevel = 99; # open folds at startup
	};

}
