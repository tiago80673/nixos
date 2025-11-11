{...}:{
	programs.zsh = {
		enable = true;
		autocd = true;
		defaultKeymap = "emacs";

		enableCompletion = true;
		enableVteIntegration = true;
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;

		history = {
			expireDuplicatesFirst = true;
			extended = true;
			ignoreDups = true;
		};
		oh-my-zsh = {
			enable = true;
			theme = "";
		};
		initExtra = ''
		  autoload -U colors && colors

		  # Show GitHub icon when in a git repo (requires Nerd Font)
		  function git_icon() {
			if git rev-parse --is-inside-work-tree >/dev/null 2>&1; then
			  echo "%B%F{magenta} %f%b"
			fi
		  }

		  # Bright bold green user@host, darker bold green path
		  PROMPT='%B%F{green}[%n@%m:%f%b%B%F{28}%~%f%b%B%F{green}]%f%b$(git_icon)%B%F{green}$%f%b '

		  # Optional: show current branch name on the right in bold cyan
		  RPROMPT='%B%F{cyan}$(git rev-parse --abbrev-ref HEAD 2>/dev/null)%f%b'

		  [[ -n $CMD ]] && eval "$CMD"
		'';
	};
}
