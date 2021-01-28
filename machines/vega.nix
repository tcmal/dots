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
            
            base00 = "#212121";
            base01 = "#303030";
            base02 = "#353535";
            base03 = "#4A4A4A";
            base04 = "#B2CCD6";
            base05 = "#EEFFFF";
            base06 = "#EEFFFF";
            base07 = "#FFFFFF";
            base08 = "#89DDFF";
            base09 = "#F78C6C";
            base0A = "#FFCB6B";
            base0B = "#C3E88D";
            base0C = "#89DDFF";
            base0D = "#82AAFF";
            base0E = "#C792EA";
            base0F = "#FF5370";
        };
    };
in {
    imports = [
        (import "${home-manager}/nixos")
        (import ../roles/de-laptop.nix customConfig)
        (import ../roles/programs.nix customConfig)
        /etc/nixos/hardware-configuration.nix
    ];
    
    system.stateVersion = "20.09";

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
    networking.hostName = "vega"; # "The Ion Catapult is designed to use only approved UAC ammunition."
    networking.networkmanager.enable = true;
    
    # Locale
    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";
    services.xserver.layout = "gb";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "uk";
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

    # Bootloader options
    boot.loader.systemd-boot.configurationLimit = 2;
    boot.loader.systemd-boot.editor = false;
    boot.loader.timeout = 0;

    # Drivers, boot options, etc. are all in hardware-configuration.nix
}
