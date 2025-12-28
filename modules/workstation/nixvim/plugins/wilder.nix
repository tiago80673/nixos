{config, ...}:
{
  # Commands and search suggestions 
  programs.nixvim.plugins.wilder = {
		  enable = true;
		  settings.modes = [":" "/" "?"];
		  #TODO this renderer is a bit buggy -> when rounded, squared layer appears bellow
		  options.renderer = config.lib.nixvim.mkRaw ''
			wilder.popupmenu_renderer(
			  wilder.popupmenu_border_theme({
				highlights = {
				  border = 'Normal', -- highlight to use for the border
				},
				-- 'single', 'double', 'rounded' or 'solid'
				-- can also be a list of 8 characters, see :h wilder#popupmenu_border_theme() for more details
				border = 'rounded',
			  -- highlighter applies highlighting to the candidates
			  highlighter = wilder.basic_highlighter(),
			  -- allow devicons for :e
			  left = {' ', wilder.popupmenu_devicons()},
			  right = {' ', wilder.popupmenu_scrollbar()},
			  })
			)
			'';
		};
}
