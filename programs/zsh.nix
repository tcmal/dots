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
    };

    profileExtra = ''
        export PATH="$PATH:$HOME/.npm/bin/";
    '';
}