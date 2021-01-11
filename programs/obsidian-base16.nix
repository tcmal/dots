# Nord Obsidian theme with system base16 theme

{ pkgs, colours, ... }:

derivation {
    name = "obsidian-base16";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out;
        HOME=$TMP ${base16-builder}/bin/base16-builder -t $customTemplate -s $customScheme -b ${colours.mode} > $out/nord-base16.css
    ''];

    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };
    customTemplate = ../share/obsidian.ejs;

    system = builtins.currentSystem;
}