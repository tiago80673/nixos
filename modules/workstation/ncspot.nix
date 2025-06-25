{
	...
}:{
	# ncspot required to define precedence of ipv4 over ipv6
	# ipv6 times out and ncspot doesn't try ipv4, not likely to be fixed
	# see https://github.com/hrkfdn/ncspot/issues/1428
	# found out that my problem was not really this... ncspot doesn't support slow connections as it doesn't retry when it fails
	programs.ncspot = {
			enable = true;
			settings = {
				keybindings = {
					"q" = "back";
					"Shift+s" = "share current";
				};
			    theme = {
					background = "#24273A";
					primary = "#CAD3F5";
					secondary = "#C6A0F6";
					title = "#8AADF4";
					playing = "#8AADF4";
					playing_selected = "#B7BDF8";
					playing_bg = "#181926";
					highlight = "#C6A0F6";
					highlight_bg = "#494D64";
					error = "#CAD3F5";
					error_bg = "#ED8796";
					statusbar = "#181926";
					statusbar_progress = "#CAD3F5";
					statusbar_bg = "#8AADF4";
					cmdline = "#CAD3F5";
					cmdline_bg = "#181926";
					search_match = "#f5bde6";
			    };
			};
		};
}
