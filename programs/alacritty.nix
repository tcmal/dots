# Terminal app

{ colours, ... }:

{
    enable = true;
    settings = {
        font = {
            normal = {
                family = "Fira Mono";
            };
            
            size = 8;
        };

        draw_bold_text_with_bright_colors = true;
        colors = {
            primary = {
                background = colours.base00;
                foreground = colours.base05;
            };
            colors = {
                normal = {
                    black = colours.base00;
                    red = colours.base08;
                    green = colours.base0B;
                    yellow = colours.base0A;
                    blue = colours.base0D;
                    magenta = colours.base0E;
                    cyan = colours.base0C;
                    white = colours.base05;
                };
                bright = {
                    black = colours.base03;
                    red = colours.base08;
                    green = colours.base0B;
                    yellow = colours.base0A;
                    blue = colours.base0D;
                    magenta = colours.base0E;
                    cyan = colours.base0C;
                    white = colours.base07;
                };
            };
        };
        window = {
            padding = {
                x = 5;
                y = 5;
            };
        };
    };
}