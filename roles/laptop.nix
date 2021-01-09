# Workstation setup

{ config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit config pkgs lib;
        terminal = "${pkgs.alacritty}/bin/alacritty";
        menu = "${pkgs.rofi}/bin/rofi -show drun";
        colours = {
            mode = "dark";

            base00 = "#1d1f21";
            base01 = "#282a2e";
            base02 = "#373b41";
            base03 = "#969896";
            base04 = "#b4b7b4";
            base05 = "#c5c8c6";
            base06 = "#e0e0e0";
            base07 = "#ffffff";
            base08 = "#CC342B";
            base09 = "#F96A38";
            base0A = "#FBA922";
            base0B = "#198844";
            base0C = "#3971ED";
            base0D = "#3971ED";
            base0E = "#A36AC7";
            base0F = "#3971ED";
        };
    };
in {
    # User account
    nix.trustedUsers = [ "mal" ];
    users.users.mal = {
        isNormalUser = true;
        home = "/home/mal";
        extraGroups = ["wheel" "networkmanager"];

        shell = pkgs.zsh;
    };
    
    # X11 setup
    services.xserver = {
        enable = true;
        displayManager = {
            defaultSession = "none+i3";
        };
        windowManager.i3.enable = true;
    };

    # Allow npm to install 'globally'
    programs.npm = {
        enable = true;
        npmrc = ''
            prefix = "$HOME/.npm"
        '';
    };

    # Fonts
    fonts.fonts = with pkgs; [
        roboto
        fira-mono
        font-awesome
    ];

    # User-specific setup
    home-manager.users.mal = {

        # Programs
        home.packages = with pkgs; [
            # Utilities
            firefox-devedition-bin
            git
            htop
            kdeApplications.okular
            unzip
            nm-tray

            # Languages, Runtimes, etc.
            nodejs
            (python3.withPackages (ppkgs: [
                ppkgs.virtualenv
            ]))
            rustup

            # Developer tools
            vscode
            vim
            obsidian
            jetbrains.idea-ultimate

            # Fun stuff
            steam
            (import ../programs/discord-base16.nix decoratedConfig)
            (import ../programs/spotify-base16.nix decoratedConfig)
        ];

        # Git setup
        programs.git = {
            enable = true;
            userName = "tcmal";
            userEmail = "oscar.shrimpton.personal@gmail.com";
        };

        # WM / DE setup
        xsession.windowManager.i3 = import ../programs/i3.nix decoratedConfig;
        home.file.".background-image".source = ../share/wallpaper.jpg;
        programs.i3status = import ../programs/i3status.nix decoratedConfig;
        programs.rofi = import ../programs/rofi.nix decoratedConfig;
        services.dunst = import ../programs/dunst.nix decoratedConfig;

        # Terminal stuff
        programs.alacritty = import ../programs/alacritty.nix decoratedConfig;
        programs.zsh = import ../programs/zsh.nix decoratedConfig;

        # GUI Applications
        home.file.".config/obsidian/themes/nord-base16.css".source = "${import ../programs/obsidian-base16.nix decoratedConfig}/nord-base16.css";
        home.file.".gtkrc-2.0".source = "${import ../programs/gtk-base16.nix decoratedConfig}/gtkrc-2.0";
        home.file.".config/gtk-3.0/gtk.css".source = "${import ../programs/gtk-base16.nix decoratedConfig}/gtk3.css";
        home.file.".vscode/extensions/base16-system".source = "${import ../programs/vscode-base16.nix decoratedConfig}/base16-system";
        home.file.".mozilla/localExtensions/base16-system.zip".source = "${import ../programs/firefox-base16.nix decoratedConfig}/addon.zip";
    };
}
