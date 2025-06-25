{
	...
}: {
	programs.firefox = {
		# enable = true; # need to manage users because this will create a new one (i think)
		profiles."tc" = {
			settings = {
				"browser.download.open_pdf_attachments_inline" = true;
			};
		};
	};
}
