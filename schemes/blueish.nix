{ pkgs, ... }:

{
    terminal = "${pkgs.alacritty}/bin/alacritty";
    menu = "${pkgs.rofi}/bin/rofi -show drun";
    iconTheme = {
        name = "Paper";
        package = pkgs.paper-icon-theme;
    };
    colours = {
        mode = "dark";
        
        base00 = "#212121";
        base01 = "#303030";
        base02 = "#353535";
        base03 = "#4A4A4A";
        base04 = "#B2CCD6";
        base05 = "#EEFFFF";
        base06 = "#EEFFFF";
        base07 = "#FFFFFF";
        base08 = "#89DDFF";
        base09 = "#F78C6C";
        base0A = "#FFCB6B";
        base0B = "#C3E88D";
        base0C = "#89DDFF";
        base0D = "#82AAFF";
        base0E = "#C792EA";
        base0F = "#FF5370";
    };
}