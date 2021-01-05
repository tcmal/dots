{ colours, ... }:

{
    enable = true;
    settings = {
        font = {
            normal = {
                family = "Fira Mono";
            };
        };
        size = "16.0";
        colors = {
            primary = {
                background = colours.background;
                foreground = colours.foreground;
            };
        };
    };
}