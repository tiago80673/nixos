{pkgs, ...}:
{
	home.packages = with pkgs; [
		nerd-fonts.jetbrains-mono
	];
	programs.kitty = {
		enable = true;

		font = {
			name = "JetBrainsMono Nerd Font";
			size = 10;
		};

		settings = {
			background = "#171421";
			foreground = "#FFFFFF";

			cursor = "#FFFFFF";
			cursor_text_color = "#171421";

			selection_background = "#3D3846";
			selection_foreground = "#FFFFFF";

			confirm_os_window_close = 0;
			enable_audio_bell = "no";
			cursor_shape = "beam";

			window_padding_width = 6;
		};
	};
}
