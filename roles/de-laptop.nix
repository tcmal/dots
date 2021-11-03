# Workstation setup

{ colours, terminal, menu, iconTheme, ... }: { config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit colours terminal menu config pkgs lib iconTheme;
    };
    recursiveMerge = (import ../share/recursiveMerge.nix lib);
in recursiveMerge [
    (import ./de-desktop.nix decoratedConfig decoratedConfig)
    {
        # Power management
        powerManagement = {
            enable = true;
            cpuFreqGovernor = "ondemand";
        };
        programs.light.enable = true;

        # Touchpad setup
        services.xserver = {
            libinput = {
                enable = true;
                
                touchpad.naturalScrolling = true; 
            };

            displayManager.autoLogin.enable = false;
        };

        # Bluetooth and pulseaudio w/ bluetooth enabled
        hardware.bluetooth.enable = true;
        services.blueman.enable = true;

        hardware.pulseaudio.package = pkgs.pulseaudioFull;

        home-manager.users.mal = {
            programs = {
                # Smaller terminal font
                alacritty.settings.font.size = 8;
            };
        };
    }
]