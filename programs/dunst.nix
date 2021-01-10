# Dunst (Notification Daemon)

{ colours, ... }:

{
    enable = true;
    
    settings = {
        global = {
            font = "Roboto, 12";
            alignment = "center";
            
            geometry = "450x10-30+60";

            padding = 16;
            horizontal_padding = 10;
            frame_width = 5;
        };
        urgency_low = {
            background = colours.base00;
            foreground = colours.base07;
            frame_color = colours.base00;
            timeout = 5;
        };
        urgency_normal = {
            background = colours.base00;
            foreground = colours.base07;
            frame_color = colours.base0D;
            timeout = 10;
        };
        urgency_critical = {
            background = colours.base00;
            foreground = colours.base07;
            frame_color = colours.base08;
            timeout = 0;
        };

        shortcuts = {
            close = "ctrl+space";
            close_all = "ctrl+shift+space";
        };
    };
}