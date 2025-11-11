# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{
  #config,
  inputs,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    # Include the results of the hardware scan.
    ./hardware-configuration.nix
    ./pkgs/change-keyboard-layout-on-usb-event/change-keyb-layout.nix
    ./modules/workstation/default.nix
    ./modules/graphical
  ];
  hardware.graphics.enable = true;
  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostId = "72fc596a";
  networking.hostName = "piupiu"; # Define your hostname.
  # Pick only one of the below networking options.
  # networking.wireless.enable = true; # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true; # Easiest to use and most distros use this by default.

  nix = {
    registry = {
      self.flake = inputs.self;
      nixpkgs = {
        from = {
          id = "nixpkgs";
          type = "indirect";
        };
        flake = inputs.nixpkgs;
      };
    };
    settings = {
      experimental-features = [
        "nix-command"
        "flakes"
      ];
    };
    channel.enable = false;
    nixPath = [
      "nixpkgs=${inputs.nixpkgs.outPath}"
    ];
  };

  # Set your time zone.
  #time.timeZone = "Europe/Lisbon"; managed by gnome dconf. this is very strict and doesn't allow override

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
    #   font = "Lat2-Terminus16";
    keyMap = "pt-latin9";
    #   useXkbConfig = true; # use xkb.options in tty.
  };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;

  # Configure keymap in X11
  services.xserver.xkb.layout = "pt";
  # services.xserver.xkb.options = "eurosign:e,caps:escape";
  #services.xserver.exportConfiguration = true;

  # Enable CUPS to print documents.
  services.printing.enable = true;

  # Enable sound.
  # hardware.pulseaudio.enable = true;
  # OR
  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  # Enable touchpad support (enabled default in most desktopManager).
  services.libinput.enable = true;

		
  
  virtualisation.docker.enable = true;

  users.mutableUsers = false; # usefull anyways but I needed this to allow gnome login to have list of users instead of typing each time the user
  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.tiagoc = {
    name = "tiagoc";
    description = "Tiago Caixinha";
    isNormalUser = true;
    extraGroups = [
      "wheel"
	  #"docker" unsafe to be in docker group, just use sudo every time instead. There is a know privilege escalation by launching containers with special perms
      "input"
      "video"
      "render"
      "networkmanager"
      "dialout"
    ];
    hashedPassword = "$y$j9T$wSVFQ9KXOcedSQ.rdH4E0/$QCmD7jMQN27WU5vFOKVnuaE1WmnFZrLFNhmz4noDZR0";

  };

  programs.firefox={
	enable = true;
	nativeMessagingHosts.packages = [ pkgs.tridactyl-native ];
  };

   services.udev.extraRules = ''
KERNEL=="hidraw*", SUBSYSTEM=="hidraw", ATTRS{serial}=="*vial:f64c2b3c*", MODE="0660", GROUP="users", TAG+="uaccess", TAG+="udev-acl"
''; # allow vial detection




  #enhanced man pages
  documentation.dev.enable = true;
  documentation.man.enable = true;
  documentation.info.enable = true;
  documentation.doc.enable = true;

	users.defaultUserShell = pkgs.zsh;
	programs.zsh.enable = true;
	
  environment.shellAliases = {
		rb = "nixos-rebuild switch --use-remote-sudo";
		rbcd = "cd $(dirname $(realpath /etc/nixos/flake.nix))";
	};
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    vim 
	
	#core
	linux-manual
	man-pages
	man-pages-posix
	htop

	clang-tools
	ripgrep
	google-chrome
	busybox
	python313
	gnome-extension-manager
	wireguard-tools
	shotcut
	obs-studio
	unstable.code-cursor
	dconf2nix
	dconf-watch-dump
	ncspot
	devenv
	tree
	stremio
	ffmpeg
	obsidian
    git
	gitFull
    waypipe
    vial
    fd
    whatsapp-for-linux
    wl-clipboard
    wl-clipboard-x11
    vscode-fhs
    #pkgs.rocmPackages.llvm.clang-tools-extra
    llvmPackages_19.clang-tools
    mpi
    gnumake
    llvmPackages_19.openmp
    gcc
    ferdium
    resources
    docker
    docker-compose
	libreoffice-qt6
  ];

	# prefer ipv4 over ipv6, tries to fix problem related to ncspot
	environment.etc = {
	  "gai.conf" = {
		text = ''
		  precedence ::ffff:0:0/96  100
		'';
		mode = "0644"; # Standard config file permissions
	  };
	};
  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  #
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system - see https://nixos.org/manual/nixos/stable/#sec-upgrading for how
  # to actually do that.
  #
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  #
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  #
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "24.11"; # Did you read the comment?
  
  programs.nix-ld.enable = true;

}
