{pkgs, ...}: {
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      text = ["write_good"];
      markdown = ["write_good"];
      nix = ["nix"];
	  make = ["checkmake"];
    };
    linters = {
      write_good = {
        cmd = "${pkgs.write-good}/bin/write-good";
      };
      checkmake  = {
        cmd = "${pkgs.checkmake}/bin/checkmake";
      };
    };

    # Trigger linting more aggressively, not only after writing a buffer
    autoCmd.event = ["BufWritePost" "BufEnter" "BufLeave"];
  };
}
