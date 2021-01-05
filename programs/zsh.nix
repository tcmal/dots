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
            "pacman"
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
}