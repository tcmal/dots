{ config, pkgs, ... }:

let customConfig = {
        terminal = "${pkgs.alacritty}/bin/alacritty";
        menu = "${pkgs.rofi}/bin/rofi -show drun";
        colours = (import ../schemes/blueish.nix);
    };
in {
    imports = [
        <home-manager/nixos>
        (import ../roles/de-laptop.nix customConfig)
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


    # US with " and @ swapped and £ on Shift+F1
    services.xserver.displayManager.sessionCommands = let compiledLayout = pkgs.runCommand "keyboard-layout" {} ''
                                                                                ${pkgs.xorg.xkbcomp}/bin/xkbcomp ${../share/mechanical.xkb} $out
                                                                            '';
    in "${pkgs.xorg.xkbcomp}/bin/xkbcomp ${compiledLayout} $DISPLAY";

	environment.etc.hosts.mode = "0644";

    # Drivers, boot options, etc. are all in hardware-configuration.nix

    boot.supportedFilesystems = [ "ntfs" ];
    #fileSystems."/mnt" = {
    #    device = "/dev/sda2";
    #    fsType = "ntfs";
    #    options = ["rw"];
    #};
}
