# xremap is insecure if run by user as it requires user processes to be able to listen to keypresses, allowing keyloggers.
# xremap-flake allows to run as a system service (secure), but doesn't work with gnome integration to detect active window specific key remaps. see https://github.com/xremap/nix-flake/blob/master/docs/HOWTO.md#nixos
# upstream xremap works with gnome extension as system service but its just not ported yet to nixos. see https://github.com/xremap/xremap/blob/master/doc/README.md#running-xremap

{pkgs, ...}:
{
	services.xremap = {
		enable = true;
		withGnome = true;
		serviceMode = "user";
		userName = "tiagoc";
		watch = true;
		config.keymap = [{
			name = "Allow sideberry to catch Ctrl Tab";
			application.only = "firefox";
			remap = { 
				"C-Tab" = "C-Shift-3"; 
				"C-Shift-Tab" = "C-Shift-4"; 
			};
		}];
	};
	# requires gnome extension that is enabled in hm

}
