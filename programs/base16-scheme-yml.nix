# Generates a .yml scheme for mustache templates

{ pkgs, colours, ... }:

pkgs.writeTextFile {
    name = "base16.yml";
    text = ''
scheme: "Autogenerated by base16-scheme-yml.nix"
author: "tcmal <oscar.shrimpton.personal@gmail.com>"
base00: "${builtins.substring 1 6 colours.base00}"
base01: "${builtins.substring 1 6 colours.base01}"
base02: "${builtins.substring 1 6 colours.base02}"
base03: "${builtins.substring 1 6 colours.base03}"
base04: "${builtins.substring 1 6 colours.base04}"
base05: "${builtins.substring 1 6 colours.base05}"
base06: "${builtins.substring 1 6 colours.base06}"
base07: "${builtins.substring 1 6 colours.base07}"
base08: "${builtins.substring 1 6 colours.base08}"
base09: "${builtins.substring 1 6 colours.base09}"
base0A: "${builtins.substring 1 6 colours.base0A}"
base0B: "${builtins.substring 1 6 colours.base0B}"
base0C: "${builtins.substring 1 6 colours.base0C}"
base0D: "${builtins.substring 1 6 colours.base0D}"
base0E: "${builtins.substring 1 6 colours.base0E}"
base0F: "${builtins.substring 1 6 colours.base0F}"
    '';
}