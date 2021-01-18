{ config, pkgs, ... }:

let home-manager = builtins.fetchGit {
        url = "https://github.com/rycee/home-manager.git";
        rev = "22f6736e628958f05222ddaadd7df7818fe8f59d";
        ref = "release-20.09";
    };
    customConfig = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        menu = "${pkgs.rofi}/bin/rofi -show drun";
        colours = {
            mode = "dark";

            base00 = "#1d1f21";
            base01 = "#282a2e";
            base02 = "#373b41";
            base03 = "#969896";
            base04 = "#b4b7b4";
            base05 = "#c5c8c6";
            base06 = "#e0e0e0";
            base07 = "#ffffff";
            base08 = "#CC342B";
            base09 = "#F96A38";
            base0A = "#FBA922";
            base0B = "#198844";
            base0C = "#3971ED";
            base0D = "#3971ED";
            base0E = "#A36AC7";
            base0F = "#3971ED";

        };
    };
in {
    imports = [
        (import "${home-manager}/nixos")
        (import ../roles/de-desktop.nix customConfig)
        (import ../roles/programs.nix customConfig)
        /etc/nixos/hardware-configuration.nix
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };
    
    # Utilities
    environment.systemPackages = with pkgs; [
        git
        zip
        unzip
    ];

    # Networking
    networking.hostName = "clovis"; # "You now face godlike judgement. May it extend eternally."
    networking.wireless.enable = true;    

    # Locale
    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "us";
    };
    
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

    # US with " and @ swapped and £ on Shift+F1
    services.xserver.displayManager.sessionCommands = let compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
                                                                                ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${../share/mechanical.xkb} $out
                                                                            '';
    in "${pkgs.xorg.xkbcomp}/bin/xkbcomp ${compiledLayout} $DISPLAY";
    
    # Drivers, boot options, etc. are all in hardware-configuration.nix
}