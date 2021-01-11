# Workstation setup

{ colours, terminal, menu, ... }: { config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit colours terminal menu config pkgs lib;
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
                naturalScrolling = true; 
                additionalOptions = ''MatchIsTouchpad "on"'';
            };

            displayManager.autoLogin.enable = false;
        };

        # Bluetooth and pulseaudio w/ bluetooth enabled
        hardware.bluetooth.enable = true;
        services.blueman.enable = true;

        hardware.pulseaudio.package = pkgs.pulseaudioFull;

        home-manager.users.mal = {
            home.packages = with pkgs; [
                xfce.xfce4-power-manager
            ];

            programs = {
                # Add battery to status bar
                i3status.modules = {
                    "battery 1" = {
                        position = 0;

                        settings = {
                            format = "%status  %remaining";

                            status_chr = "";
                            status_bat = "";
                            status_full = "";
                            low_threshold = 30;
                            threshold_type = "time";
                        };

                    };
                };

                # Smaller terminal font
                alacritty.settings.font.size = 8;
            };

            
            # Brightness controls and xfce4-power-manager for low battery notifications
            xsession.windowManager.i3.config = {
                startup = [
                    { command = "${pkgs.xfce.xfce4-power-manager}/bin/xfce4-power-manager"; always = true; }
                ];

                keybindings = lib.mkOptionDefault {
                    "XF86MonBrightnessUp" = lib.mkForce "exec --no-startup-id light -A 5";
                    "XF86MonBrightnessDown" = lib.mkForce "exec --no-startup-id light -U 5";
                };
            };
        };
    }
]