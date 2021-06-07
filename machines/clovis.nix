{ config, pkgs, ... }:

let 
    customConfig = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        menu = "${pkgs.rofi}/bin/rofi -show drun";
        colours = (import ../schemes/blueish.nix);
    };
in {
    imports = [
        <home-manager/nixos>
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
        ntfs3g
        piper
    ];
    services.ratbagd.enable = true;

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

    # Fix broken primary monitor detection
    services.xserver.xrandrHeads = [
        {
            output = "HDMI-0";
            primary = true;
        }
    ];

    # US with " and @ swapped and £ on Shift+F1
    services.xserver.displayManager.sessionCommands = let compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
                                                                                ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${../share/mechanical.xkb} $out
                                                                            '';
    in "${pkgs.xorg.xkbcomp}/bin/xkbcomp ${compiledLayout} $DISPLAY";
    
    # Drivers, boot options, etc. are all in hardware-configuration.nix
}