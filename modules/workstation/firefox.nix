{
	pkgs,
	...
}: {
	programs.firefox = {
		enable = true; # note that this will create a new firefox profile on ~/.mozilla/firefox with the name bellow. Can check profiles on about:profiles
		profiles."tiagocaixinha" = { # if tiagocaixinha folder already exists it will try to apply this on top of what's there afaik
			settings = {
				"browser.download.open_pdf_attachments_inline" = true; # avoid downloading
				"toolkit.legacyUserProfileCustomizations.stylesheets" = true; # allow custom css
				#remove swipe gestures
			    "browser.gesture.swipe.left" = "cmd_scrollLeft";
			    "browser.gesture.swipe.right" = "cmd_scrollRight";
			};
			search.engines = {
				# Add custom engines
				wikipedia-pt = {
				  name = "Wikipedia (pt)";
				  urls = [
					{
					  template = "https://pt.wikipedia.org/w/index.php?search={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://pt.wikipedia.org/favicon.ico";

				  definedAliases = [ "@wp" ];
				};

				youtube = {
				  name = "Youtube";
				  urls = [
					{
					  template = "https://www.youtube.com/results?search_query={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://www.youtube.com/s/desktop/abf9a709/img/favicon_32x32.png";

				  definedAliases = [ "@y" ];
				};

				# NixOS
				nixos-wiki = {
				  name = "NixOS Wiki";
				  urls = [ { template = "https://wiki.nixos.org/w/index.php?search={searchTerms}"; } ];
				  definedAliases = [ "@nw" ];
				  iconMapObj."16" = "https://wiki.nixos.org/favicon.ico";
				};
				nix-packages = {
				  name = "Nixpkgs";
				  urls = [
					{
					  template = "https://search.nixos.org/packages?query={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://search.nixos.org/favicon.png";
				  definedAliases = [ "@np" ];
				};

				nixos-options = {
				  name = "NixOS";
				  urls = [
					{
					  template = "https://search.nixos.org/options?query={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://search.nixos.org/favicon.png";
				  definedAliases = [ "@no" ];
				};

				nix-flakes = {
				  name = "Nix Flakes";
				  urls = [
					{
					  template = "https://search.nixos.org/flakes?query={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://search.nixos.org/favicon.png";
				  definedAliases = [ "@nf" ];
				};

				my-nixos = {
				  name = "My NixOS";
				  urls = [
					{
					  template = "https://mynixos.com/search?q={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://mynixos.com/icon.svg";
				  definedAliases = [ "@na" ];
				};

				github-nix = {
				  name = "Github Nix";
				  urls = [
					{
					  template = "https://github.com/search?q=language%3ANix+{searchTerms}&type=code";
					}
				  ];
				  iconMapObj."16" = "https://search.nixos.org/favicon.png";
				  definedAliases = [ "@ng" ];
				};

				homemanager-nix= {
				  name = "Home-Manager";
				  urls = [
					{
					  template = "https://home-manager-options.extranix.com/?query={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://home-manager-options.extranix.com/images/favicon.png";
				  definedAliases = [ "@nh" ];
				};

				nvim-nix= {
				  name = "NixVim";
				  urls = [
					{
					  template = "https://nix-community.github.io/nixvim/plugins/copilot-lsp/index.html?search={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://nix-community.github.io/nixvim/favicon.png"; #TODO get better favicon
				  definedAliases = [ "@nv" ];
				};

			};
			userChrome = ''
				/* Only show close button on the active tab */
				.tabbrowser-tab:not([selected]) .tab-close-button {
					visibility: collapse !important;
				}
			'';
			  extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
				# essencial extensions
				tridactyl
				bitwarden
				# other extensions are added as I log in mozzila account, and even has the advantage of turning them on automatically
			  ];
		};
	};
}
