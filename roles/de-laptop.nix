# Workstation setup

{ colours, terminal, menu, ... }: { config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit colours terminal menu config pkgs lib;
    };
in lib.recursiveUpdate (import ./de-desktop.nix decoratedConfig decoratedConfig) {
    # Power management
    powerManagement = {
        enable = true;
        cpuFreqGovernor = "ondemand";
    };

    # Touchpad setup
    services.xserver = {
        libinput = {
            enable = true;

            naturalScrolling = true;
        };

        displayManager.autoLogin.enable = false;
    };

    home-manager.users.mal = {
        # Add battery to status bar
        programs.i3status.modules = {
            "battery 1" = {
                position = 0;
            };
        };
    };
}