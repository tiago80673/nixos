{
    pkgs,
	lib,
	...
}:{
	programs.gnome-shell.enable = true;
	programs.gnome-shell.extensions = with pkgs.gnomeExtensions; [
		{package = space-bar; }
		{package = resource-monitor; }
	]; 

  dconf = {
    enable=true;
    settings =
      {
	"org/gnome/login-screen" = {
     	  disable-user-list=false;  
        };
	"org/gnome/shell/keybindings" = {
          show-screenshot-ui=["<Shift><Super>s"];
        };

        "org/gnome/desktop/interface" = {
	  color-scheme="prefer-dark";
        };
	"org/gnome/mutter" = {
  	  dynamic-workspaces=true;
	};
	#"org/gnome/Weather" = {
	#  locations = ["<(uint32 2, <('Lisbon', 'LPPT', true, [(0.6766059791742326, -0.15940673253105125)], [(0.67573331454823549, -0.15940673253105125)])>)>" "<(uint32 2, <('Meco', '', true, [(0.6717500133, -0.1602881497)], @a(dd) [])> )>"];
	#};
    "org/gnome/Weather" = with lib.gvariant; {
      #https://www.reddit.com/r/gnome/comments/194dvz1/comment/khjk7n5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button
      locations = [
        (mkVariant
          (mkTuple [
            (mkUint32 2)
            (mkVariant
              (mkTuple [
                "Seattle"
                "KBFI"
                true
                [ (mkTuple [ 0.82983133145337307 (-2.134775231953554) ]) ]
                [ (mkTuple [ 0.83088509144255718 (-2.135097419733472) ]) ]
              ])
            )
          ])
        )
      ];
    };

	"org/gnome/shell/weather" = {
  	  locations = "[<(uint32 2, <('Lisbon', 'LPPT', true, [(0.6766059791742326, -0.15940673253105125)], [(0.67573331454823549, -0.15940673253105125)])>)>]";
	};
	"org/gnome/GWeather4" = {
	  "temperature-unit" = "centigrade";
	};
  
	"org/gnome/Console" = {
	  "custom-font" = "NotoSansM Nerd Font Mono 10";
	};
  
		"org/gnome/desktop/peripherals/touchpad" = {
		  "disable-while-typing" = false;
		};
						
		"org/gnome/desktop/sound" = {
		  "allow-volume-above-100-percent" = true;
		};
		"org/gnome/desktop/wm/keybindings" = {
			# activate-window-menu = [ "@as []" ]; # home manager is cleaner and hides this ugly syntax
			activate-window-menu = [ ];
		};
		"org/gnome/settings-daemon/plugins/media-keys" = {
			play = [ "<Alt>space" ];
		};
		# "org/gnome/desktop/wm/keybindings" = {
		# 	switch-to-workspace-2 = [ "<super>2"];
		# };
		"org/gnome/shell/keybindings" = {
			switch-to-application-1 = [ ];
			switch-to-application-2 = [ ];
			switch-to-application-3 = [ ];
			switch-to-application-4 = [ ];
			switch-to-application-5 = [ ];
			switch-to-application-6 = [ ];
			switch-to-application-7 = [ ];
			switch-to-application-8 = [ ];
			switch-to-application-9 = [ ];
		};
		"org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
          binding = "<Super>Return";
          command = "kgx";
          name = "Launch terminal";
        };

		"com/github/Ory0n/Resource_Monitor" = {
		  #globals
		  extensionposition = "right";
		  iconsposition = "left";
		  itemsposition = [ "ram" "cpu" "swap" "stats" "space" "eth" "wlan" "gpu" ];
		  # net
		  netautohidestatus = true;
		  netunitmeasure = "m";
		  # ram
		  ramalert = true;
		  ramalertthreshold = 8;
		  ramunitmeasure = "g";
		  # cpu
		  thermalcputemperaturestatus = true;
		  # disable defaults
		  diskspacestatus = false;
		  diskstatsstatus = false;
		};
    };
  };
}
