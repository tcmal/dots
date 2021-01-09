# Userstyles, using base16-builder to substitute in the palette.

{ pkgs, colours, ... }:

derivation {
    name = "userstyles";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        $coreutils/bin/mkdir -p $out;
        for f in $srcDir/*.ejs; do
            styleName=`$coreutils/bin/basename $f .ejs`;
            HOME=$TMP ${base16-builder}/bin/base16-builder -t $f -s $customScheme -b ${colours.mode} > $out/$styleName.css
        done;
    ''];

    coreutils = pkgs.coreutils;
    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };
    srcDir = ../share/userstyles;

    system = builtins.currentSystem;
}