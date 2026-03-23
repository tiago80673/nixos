{
	wayland.windowManager.hyprland = {
		enable = true;

		settings = {
			"$mod" = "SUPER";

			monitor = ",preferred,auto,1";

			exec-once = [
				"waybar"
				"dunst"
			];
			# Enable touchpad gestures
			gesture = "3, horizontal, workspace";

			input = {
				kb_layout = "us";
				follow_mouse = 1; #window focus follows mouse
				touchpad = {
					natural_scroll = true;
				};
				repeat_rate = 50; # rate = 1000/delay
				repeat_delay = 200;
			};
			general = {
				gaps_in = 5;
				gaps_out = 10;
				border_size = 2;
				layout = "dwindle";
			};

			decoration = {
				rounding = 6;
			};

			animations = {
				enabled = true;
			};

			dwindle = {
				pseudotile = true;
				preserve_split = true;
			};

			bind = [
				"$mod SHIFT, RETURN, exec, kitty"
				"$mod, Q, killactive,"
				"$mod, M, exit,"
				"$mod, E, exec, wofi --show drun"
				"$mod, V, togglefloating,"
				"$mod, F, fullscreen,"


				# Volume and Media Control
				", XF86AudioRaiseVolume, exec, pamixer -i 10"
				", XF86AudioLowerVolume, exec, pamixer -d 10"

				# Switch workspaces with mod + [0-9]
				"$mod, 1, workspace, 1"
				"$mod, 2, workspace, 2"
				"$mod, 3, workspace, 3"
				"$mod, 4, workspace, 4"
				"$mod, 5, workspace, 5"

				# Move focus with mod + arrow keys
				"$mod, H, movefocus, l"
				"$mod, L, movefocus, r"
				"$mod, K, movefocus, u"
				"$mod, J, movefocus, d"
			];
			
			bindm = [
				# Move/resize windows with mod + LMB/RMB and dragging
				"$mod, mouse:272, movewindow"
				"$mod, mouse:273, resizewindow"
			];
		};
	};
}
