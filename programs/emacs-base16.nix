# System base16 theme for emacs

{ pkgs, colours, ... }:

derivation {
    name = "emacs-base16";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out;
        HOME=$TMP ${mustache-go}/bin/mustache $customScheme $customTemplate > $out/base16-custom-theme.el
    ''];

    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };
    customTemplate = ../share/base16-custom-theme.mustache;

    system = builtins.currentSystem;
}