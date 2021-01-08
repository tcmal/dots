# Set GTK's colour scheme to the base16 one.

{ pkgs, colours, ... }:

derivation {
    name = "gtk-base16";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out;
        HOME=$TMP ${base16-builder}/bin/base16-builder -t gtk-3.0 -s $customScheme -b ${colours.mode} > $out/gtk3.css
        HOME=$TMP ${base16-builder}/bin/base16-builder -t gtk-2.0 -s $customScheme -b ${colours.mode} > $out/gtkrc-2.0
    ''];

    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };

    system = builtins.currentSystem;
}