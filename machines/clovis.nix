{ config, pkgs, ... }@args:

let scheme = (import ../schemes/blueish.nix args);
in {
    imports = [
        <home-manager/nixos>
        (import ../roles/de-desktop.nix scheme)
        (import ../roles/programs.nix scheme)
        /etc/nixos/hardware-configuration.nix
    ];

    nix = {
        binaryCaches = [
            "https://hydra.iohk.io"
            "https://nix-community.cachix.org"
        ];
        binaryCachePublicKeys = [
            "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
            "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
            "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
        ];
    };

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
    services.xserver.layout = "us-mech";
    services.xserver.extraLayouts.us-mech = {
        description = "Mechanical keyboard layout";
        languages = [ "eng" ];
        symbolsFile = ../share/symbols/us-mech;
    };

    home-manager.users.mal.programs.git.extraConfig = {
      user.signingkey = "CF32FEF6BD22D30C5A4C77B5EA97081FFD78EF04";
      commit.gpgsign = true;
    };

    # Drivers, boot options, etc. are all in hardware-configuration.nix
}
