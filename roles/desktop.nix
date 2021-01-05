{ config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit config pkgs lib;
        terminal = "${pkgs.alacritty}/bin/alacritty";
        menu = "${pkgs.rofi}/bin/rofi -show combi";
        colours = {
            primary = "#4d57a0";
            primaryText = "#fcfcfc";
            secondary = "#0d0932";
            secondaryText = "#fcfcfc";
            accent = "#c4a8d2";
            accentText = "#fcfcfc";
            background = "#0e0a23";
            foreground = "#fcfcfc";
        };
    };
in {

    fonts.fonts = [
        pkgs.roboto
        pkgs.fira-mono
        pkgs.font-awesome
    ];

    nix.trustedUsers = [ "mal" ];
    users.users.mal = {
        isNormalUser = true;
        home = "/home/mal";
        extraGroups = ["wheel" "networkmanager"];

        shell = pkgs.zsh;
    };

    services.xserver.enable = true;
    services.xserver.windowManager.i3.enable = true;
    
    home-manager.users.mal = {
        home.packages = [
            pkgs.firefox
        ];

        programs.git = {
            enable = true;
            userName = "tcmal";
            userEmail = "oscar.shrimpton.personal@gmail.com";
        };

        programs.rofi = (import ../programs/rofi.nix) decoratedConfig;

        programs.alacritty = (import ../programs/alacritty.nix) decoratedConfig;

        programs.zsh = (import ../programs/zsh.nix) decoratedConfig;

        xsession.windowManager.i3 = lib.mkMerge [
            ((import ../programs/i3.nix) decoratedConfig)
            {
                config.startup = [
                    { command = "${pkgs.xfce.xfce4-power-manager}/bin/xfce4-power-manager"; always = true; }
                ];
            }
        ];

        programs.i3status = lib.mkMerge [
            ((import ../programs/i3status.nix) decoratedConfig)
            {
                modules."battery 0" = {
                    position = -1;
                    settings = {
                        format = "%status   %remaining";
                        format_down = "";
                        status_chr = "";
                        status_bat = "";
                        status_unk = "";
                        status_full = "";
                        path = "/sys/class/power_supply/BAT%d/uevent";
                        low_threshold = 10;
                    };
                };
            }
        ];
        home.file.".background-image".source = ../share/wallpaper.jpg;
    };
}