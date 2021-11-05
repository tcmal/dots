{ config, pkgs, ... }@args:

let scheme = (import ../schemes/blueish.nix args);
in {
    imports = [
        <home-manager/nixos>
        (import ../roles/de-desktop.nix scheme)
        (import ../roles/programs.nix scheme)
        /etc/nixos/hardware-configuration.nix
    ];

    nix.binaryCaches = [
        "https://hydra.iohk.io"
    ];
    nix.binaryCachePublicKeys = [
        "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };
    
    # Mouse configuration
    environment.systemPackages = with pkgs; [
        piper
    ];
    services.ratbagd.enable = true;

    # Networking
    networking.hostName = "clovis"; # "You now face godlike judgement. May it extend eternally."
    networking.networkmanager.enable = true;    

    # Locale
    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "us";
    };
    
    # Extra audio fix
    hardware.pulseaudio = {
        extraConfig = ''
            load-module module-remap-source source_name=record_mono master=alsa_input.pci-0000_00_14.2.analog-stereo master_channel_map=front-left channel_map=mono
            load-module module-echo-cancel source_name=record_mono aec_method=webrtc format=s16le rate=44100 channels=1
            set-default-source record_mono
        '';
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