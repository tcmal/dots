# Workstation setup

scheme: { config, pkgs, lib, ... }:

let recursiveMerge = (import ../share/recursiveMerge.nix lib);
in {
    # User account
    nix.trustedUsers = [ "mal" ];
    users.users.mal = {
        isNormalUser = true;
        home = "/home/mal";
        extraGroups = ["wheel" "networkmanager" "video"];
    };
    
    # Custom DNS
    networking.nameservers = [ "1.1.1.1" ];

    # Audio
    sound.enable = true;
    hardware.pulseaudio = {
        enable = true;

        support32Bit = true;
    };

    # OpenGL
    hardware.opengl = {
        enable = true;

        driSupport = true;
        driSupport32Bit = true;
    };

    # X11 setup
    services.xserver = {
        enable = true;
        displayManager = {
            sddm.enable = true;
            defaultSession = "none+xmonad";

            autoLogin = {
                enable = true;
                user = "mal";
            };
        };
	    
        windowManager.xmonad.enable = true;
    };

    # Reduce eye strain
    services.redshift = {
        enable = true;
    };
    
    location = {
        provider = "manual";
        
        # Edinburgh, Scotland
        latitude = 55.9533;
        longitude = 3.1883;
    };

    # Fonts
    fonts.fonts = with pkgs; [
        roboto
        fira-mono
        font-awesome
    ];

    services.dbus.packages = [ pkgs.gnome3.dconf ];

    # User-specific setup
    home-manager.users.mal = (args: let decoratedConfig = { inherit scheme pkgs; inherit (args) config lib; }; in {
        home.packages = with pkgs; [
            # todo: fix keychain/dconf stuff
            dconf

            pkgs.haskellPackages.xmobar

            # used in xmonad scripts/binds
            dex
            (import ../programs/shutdown-menu.nix { inherit pkgs; })
            feh
            libnotify

            # useful utilities
            pavucontrol
            htop
            okular
        ];

        # WM / DE setup
        xsession.windowManager.xmonad = {
            enable = true;
            enableContribAndExtras = true;

            config = ../share/xmonad.hs;
        };

        programs.xmobar = {
            enable = true;
            extraConfig = builtins.readFile ../share/xmobarrc;
        };

        home.file.".background-image".source = ../share/wallpaper.png;
        programs.rofi = import ../programs/rofi.nix decoratedConfig;

        services.picom = import ../programs/picom.nix decoratedConfig;
        services.dunst = import ../programs/dunst.nix decoratedConfig;
        services.redshift = {
            enable = true;

            latitude = "55.953251";
            longitude = "-3.188267";
        };
    });
}
