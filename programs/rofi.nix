# Application launcher

{ colours, ... }:

{
    enable = true;

    font = "Fira Mono 14";

    location = "top";
    yoffset = 200;
    padding = 10;
    scrollbar = false;
    extraConfig = ''
        rofi.line-padding = 5;
    '';

    colors = {
        window = {
            border = colours.base00;
            background = colours.base00;
            separator = colours.base00;
        };
        rows = {
            normal = {
                background = colours.base00;
                backgroundAlt = colours.base00;
                foreground = colours.base07;
                highlight = {
                    background = colours.base07;
                    foreground = colours.base00;
                };
            };
            urgent = {
                background = colours.base00;
                backgroundAlt = colours.base00;
                foreground = colours.base08;
                highlight = {
                    background = colours.base08;
                    foreground = colours.base00;
                };
            };
        };
    };
}