# ZSH and zprezto

{ pkgs, ... }:

{
    enable = true;

    prezto = {
        enable = true;

        pmodules = [
            "environment"
            "terminal"
            "history"
            "directory"
            "spectrum"
            "utility"
            "ssh"
            "completion"
            "command-not-found"
            "node"
            "prompt"
            "utility"
            "git"
            "syntax-highlighting"
            "history-substring-search"
            "prompt"
        ];

        prompt = {
            theme = "sorin";
        };

        editor = {
            dotExpansion = true;
        };

        extraConfig = ''
            export PATH="$PATH:$HOME/.npm/bin/";
            export EDITOR=vim;
            eval "$(${pkgs.direnv}/bin/direnv hook zsh)";
        '';
    };
}