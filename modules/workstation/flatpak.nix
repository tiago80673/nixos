{...}:
{
	services.flatpak = {
		enable = true;
		packages = [
			"org.jdownloader.JDownloader"
		];
		
		# part of JDownloader is closed source so only allow access to JD folder. no peeking on my other files
		# check permissions with `flatpak info --show-permissions org.jdownloader.JDownloader`
		# or in manifest https://github.com/flathub/org.jdownloader.JDownloader/blob/master/org.jdownloader.JDownloader.yaml

		# a more secure solution would be to run the jdownloader binary inside a container https://github.com/NixOS/nixpkgs/issues/41321#issuecomment-1120217437
		overrides."org.jdownloader.JDownloader" = {
			Context = {
				filesystems = [
					"~/Downloads/JD"
					# remove paths allowed by default manifest for jdownloader
					# man 5 flatpak-metadata
					# flatpak run --command=sh org.jdownloader.JDownloader
					"!xdg-download"
					"!/media"
					"!/run/media"
				];	

				# the app can still access the X11 socket and clipboard content
				# x11 security sucks and there is no way to limit clipboard access for certain apps 
				# jdownloader doesnt support wayland
			};
		};
	};
}
