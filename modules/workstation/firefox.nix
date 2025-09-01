{
	pkgs,
	...
}: {
	programs.firefox = {
		enable = true; # note that this will create a new firefox profile on .mozilla folder with the name bellow. Can check profiles on about:profiles
		profiles."tiagocaixinha" = { # just be sure that a tiagocaixinha folder doesn't already exist under .mozzila/firefox
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
				tridactyl
				bitwarden
			];
		};
	};
}
