# A simple firefox theme that matches system colours
# This is unsigned, so you'll need to use unbranded firefox and set xpinstall.signatures.required to false.

{ pkgs, colours, ... }:

derivation {
    name = "firefox-base16";

    builder = "${pkgs.bash}/bin/bash";
    args = with pkgs; [ "-c" ''
        ${coreutils}/bin/mkdir -p $out;
        cd $TMP;
        HOME=$TMP ${mustache-go}/bin/mustache $customScheme $template > manifest.json;
        ${zip}/bin/zip $out/addon.zip manifest.json;
    ''];

    customScheme = (import ./base16-scheme-yml.nix) { inherit pkgs colours; };
    template = ../share/firefox.mustache;

    system = builtins.currentSystem;
}