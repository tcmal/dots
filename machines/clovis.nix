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
    networking.networkmanager.enable = true;    

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

        extraConfig = ''
            load-module module-remap-source source_name=record_mono master=alsa_input.pci-0000_00_14.2.analog-stereo master_channel_map=front-left channel_map=mono
            load-module module-echo-cancel source_name=record_mono aec_method=webrtc format=s16le rate=44100 channels=1
            set-default-source record_mono
        '';
    };

    # OpenGL
    hardware.opengl = {
        enable = true;

        driSupport = true;
        driSupport32Bit = true;
    };
    
    nixpkgs.overlays = [
        (self: super: {
            steam = super.steam.override {
                extraProfile = ''
                    export VK_ICD_FILENAMES=${config.hardware.nvidia.package}/share/vulkan/icd.d/nvidia_icd.json:${config.hardware.nvidia.package.lib32}/share/vulkan/icd.d/nvidia_icd32.json:$VK_ICD_FILENAMES
                '';
                extraLibraries = pkgs: [ pkgs.pipewire ];
            };
        })
    ];

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