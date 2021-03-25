# Workstation setup

{ colours, terminal, menu, ... }: { config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit colours terminal menu config pkgs lib;
    };
    recursiveMerge = (import ../share/recursiveMerge.nix lib);
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

    # X11 setup
    services.xserver = {
        enable = true;
        displayManager = {
            defaultSession = "none+i3";

            autoLogin = {
                enable = true;
                user = "mal";
            };
        };
        windowManager.i3.enable = true;
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

    # User-specific setup
    home-manager.users.mal = {
        home.packages = with pkgs; [
            gnome3.dconf
            pavucontrol

            xfce.thunar
        ];

        # WM / DE setup
        xsession.windowManager.i3 = recursiveMerge [
            (import ../programs/i3.nix decoratedConfig)
            {
                config.startup = [
                    { command = "${pkgs.thunderbird}/bin/thunderbird"; always = false; }
                ];
            }
        ];

        home.file.".background-image".source = ../share/wallpaper.png;
        programs.i3status = import ../programs/i3status.nix decoratedConfig;
        programs.rofi = import ../programs/rofi.nix decoratedConfig;
        services.dunst = import ../programs/dunst.nix decoratedConfig;

        services.redshift = {
            enable = true;
            tray = true;
            
            latitude = "55.953251";
            longitude = "-3.188267";
        };
    };
}
