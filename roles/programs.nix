# Workstation setup

{ colours, ... }: { config, pkgs, lib, ... }:

let decoratedConfig = {
        inherit config pkgs lib colours;
    };
in {
    # Use ZSH
    users.users.mal = {
        shell = pkgs.zsh;
    };

    # Allow npm to install 'globally'
    programs.npm = {
        enable = true;
        npmrc = ''
            prefix = "$HOME/.npm"
        '';
    };

    # User-specific setup
    home-manager.users.mal = {

        # Programs
        home.packages = with pkgs; [
            # Utilities
            firefox-devedition-bin
            thunderbird
            git
            htop
            kdeApplications.okular
            unzip
            gnome3.dconf

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

        # Terminal stuff
        programs.alacritty = import ../programs/alacritty.nix decoratedConfig;
        programs.zsh = import ../programs/zsh.nix decoratedConfig;

        # GUI Applications
        gtk = {
            enable = true;
            theme = {
                name = "Materia-Base16";
                package = (import ../programs/gtk-base16.nix decoratedConfig);
            };
        };

        home.file.".config/obsidian/themes/nord-base16.css".source = "${import ../programs/obsidian-base16.nix decoratedConfig}/nord-base16.css";
        home.file.".vscode/extensions/base16-system".source = "${import ../programs/vscode-base16.nix decoratedConfig}/base16-system";
        home.file.".mozilla/localExtensions/base16-system.zip".source = "${import ../programs/firefox-base16.nix decoratedConfig}/addon.zip";
        home.file.".config/userstyles".source = "${import ../programs/userstyles.nix decoratedConfig}";
    };
}
