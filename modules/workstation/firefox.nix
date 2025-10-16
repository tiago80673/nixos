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
				# Assign aliases to internal engines
				ddg.metaData.alias = "@d";
				"policy-DuckDuckGo Lite".metaData.alias = "@l";
				wikipedia.metaData.alias = "@w";
				# don't hide this bullshit because sadly it's useful
				google.metaData.alias = "@g";

				# Add custom engines
				wikipedia-ru = {
				  name = "Wikipedia (ru)";
				  urls = [
					{
					  template = "https://ru.wikipedia.org/w/index.php?search={searchTerms}";
					}
				  ];
				  iconMapObj."16" = "https://ru.wikipedia.org/favicon.ico";

				  definedAliases = [ "@wr" ];
				};

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
				  iconMapObj."16" = "https://mynixos.com/favicon.png";
				  definedAliases = [ "@na" ];
				};

			};
			userChrome = ''
				/* Only show close button on the active tab */
				.tabbrowser-tab:not([selected]) .tab-close-button {
					visibility: collapse !important;
				}
			'';
			  extensions = with pkgs.nur.repos.rycee.firefox-addons; [
				# essencial extensions
				tridactyl
				bitwarden
				# other extensions are added as I log in mozzila account, and even has the advantage of turning them on automatically
			  ];
		};
	};
}
