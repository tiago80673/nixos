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

	
    "org/gnome/desktop/datetime" = {
      automatic-timezone = true;
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
		    move-to-workspace-1 = [ "<Super><Shift>1" ];
		    move-to-workspace-2 = [ "<Super><Shift>2" ];
		    move-to-workspace-3 = [ "<Super><Shift>3" ];
		    move-to-workspace-4 = [ "<Super><Shift>4" ];
		    move-to-workspace-5 = [ "<Super><Shift>5" ];
		    move-to-workspace-6 = [ "<Super><Shift>6" ];
		    move-to-workspace-7 = [ "<Super><Shift>7" ];
		    move-to-workspace-8 = [ "<Super><Shift>8" ];
		    move-to-workspace-9 = [ "<Super><Shift>9" ];
		    move-to-workspace-10 = [ "<Super><Shift>0" ];
		};
	    "org/gnome/shell/extensions/space-bar/shortcuts" = {
		   enable-move-to-workspace-shortcuts = true;
	    };

		"org/gnome/settings-daemon/plugins/media-keys" = {
			play = [ "<Alt>space" ];
	        custom-keybindings = [ "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/" ];
		};
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
		  binding = "<Shift><Super>Return";
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
