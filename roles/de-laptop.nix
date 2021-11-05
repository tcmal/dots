# Workstation setup

scheme: { config, pkgs, lib, ... }@args:

let recursiveMerge = (import ../share/recursiveMerge.nix lib);
in recursiveMerge [
    (import ./de-desktop.nix scheme args)
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
    }
]