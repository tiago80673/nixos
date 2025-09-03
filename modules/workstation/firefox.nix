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
