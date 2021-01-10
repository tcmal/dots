# System base16 colour scheme

{ pkgs, colours, ... }:

derivation {
    name = "idea-base16";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out;
        HOME=$TMP ${base16-builder}/bin/base16-builder -t idea -s $customScheme -b ${colours.mode} > $out/base16-system.icls;

        ${coreutils}/bin/mkdir -p $TMP/options;
        cd $TMP;
        HOME=$TMP ${base16-builder}/bin/base16-builder -t $customTemplates/material_theme.ejs -s $customScheme -b ${colours.mode} > options/material_theme.xml
        HOME=$TMP ${base16-builder}/bin/base16-builder -t $customTemplates/material_custom_theme.ejs -s $customScheme -b ${colours.mode} > options/material_custom_theme.xml
        ${coreutils}/bin/touch 'IntelliJ IDEA Global Settings';
        ${zip}/bin/zip -r $out/base16-system-ui.jar options 'IntelliJ IDEA Global Settings';
    ''];

    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };
    customTemplates = ../share/idea;

    system = builtins.currentSystem;
}