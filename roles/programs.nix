# Workstation setup

{ colours, iconTheme, ... }: { config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit config pkgs lib colours iconTheme;
    };
in {
    # Use ZSH
    users.users.mal = {
        shell = pkgs.zsh;
    };

    fonts.fonts = with pkgs; [
        lmodern
    ];

    # Generate icon cache
    gtk.iconCache.enable = true;
    
    # Docker
    virtualisation.docker.enable = true;
    users.extraGroups.docker.members = [ "mal" ];

    # Virtualbox
    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
    users.extraGroups.vboxusers.members = [ "mal" ];

    # User-specific setup
    home-manager.users.mal = {

        # Programs
        home.packages = with pkgs; [
            # Utilities
            git
            unzip
            file
            ldns
            vim
            binutils
            openvpn
            vlc
            zoxide
            fzf
            
            gimp
            blender
            inkscape
            imagemagick

            # Web
            firefox-devedition-bin
            thunderbird

            # Collaboration
            zoom-us
            teams
            (import ../programs/discord-base16.nix decoratedConfig)

            # LaTeX stuff
            lyx
            (texlive.combine {
                inherit (texlive) scheme-medium pgfplots;
            })
            librsvg
            shutter
            libreoffice
            arandr
            openssl
            jabref

            # Languages, Runtimes, etc.
            nodejs
            (python3.withPackages (ppkgs: [
                ppkgs.virtualenv
            ]))
            rustup
            gcc
            sage

            # Developer tools
            (import ../programs/vscode-extensions.nix decoratedConfig)
            obsidian
            jetbrains.idea-ultimate
            direnv
            exercism
            (lowPrio lldb)

            # Games, etc
            steam
            steam-run-native
            multimc
            vulkan-loader
            vulkan-tools
        ];

        # Git setup
        programs.git = {
            enable = true;
            userName = "tcmal";
            userEmail = "oscar.shrimpton.personal@gmail.com";

            extraConfig = {
                init.defaultBranch = "main";
		        pull.rebase = true;
            };
        };

        # Lorri + Direnv
        services.lorri.enable = true;

        # Terminal stuff
        programs.alacritty = import ../programs/alacritty.nix decoratedConfig;
        programs.zsh = import ../programs/zsh.nix decoratedConfig;

        # GUI Applications
        gtk = {
            enable = true;
            theme = {
                name = "Materia-Base16-dark";
                package = (import ../programs/gtk-base16.nix decoratedConfig);
            };

            inherit iconTheme;
        };

        xsession.pointerCursor ={
            name = "Paper";
            package = pkgs.paper-icon-theme;
        };

        home.file.".lyx/colours".source = "${import ../programs/lyx-base16.nix decoratedConfig}/colours";
        home.file.".config/obsidian/themes/nord-base16.css".source = "${import ../programs/obsidian-base16.nix decoratedConfig}/nord-base16.css";
        home.file.".vscode/extensions/base16-system".source = "${import ../programs/vscode-base16.nix decoratedConfig}/base16-system";
        home.file.".mozilla/localExtensions/base16-system.zip".source = "${import ../programs/firefox-base16.nix decoratedConfig}/addon.zip";
        home.file.".config/JetBrains/theme/".source = import ../programs/idea-base16.nix decoratedConfig;
        home.file.".config/userstyles".source = "${import ../programs/userstyles.nix decoratedConfig}";
    };
}
