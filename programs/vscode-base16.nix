# VSCode colour scheme with system base16 colours

{ pkgs, colours, ... }:

derivation {
    name = "vscode-base16";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out/base16-system;
        ${coreutils}/bin/cp -r $scaffold/* $out/base16-system;
        ${coreutils}/bin/ls $out;
        HOME=$TMP ${base16-builder}/bin/base16-builder -t $template -s $customScheme -b ${colours.mode} > $out/base16-system/scheme.tmTheme
    ''];

    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };
    template = ../share/vscode.ejs;
    scaffold = ../share/base16-system;

    system = builtins.currentSystem;
}