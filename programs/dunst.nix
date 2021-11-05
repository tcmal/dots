# Dunst (Notification Daemon)

{ scheme, ... }:

{
    enable = true;
    iconTheme = scheme.iconTheme;
    
    settings = with scheme.colours; {
        global = {
            font = "Roboto, 12";
            alignment = "center";
            
            geometry = "450x10-30+60";

            padding = 16;
            horizontal_padding = 10;
            frame_width = 5;
            maxIconSize = 20;
        };
        urgency_low = {
            background = base00 + "80";
            foreground = base07;
            frame_color = base00 + "80";
            timeout = 5;
        };
        urgency_normal = {
            background = base00 + "80";
            foreground = base07;
            frame_color = base00 + "80";
            timeout = 10;
        };
        urgency_critical = {
            background = base00 + "80";
            foreground = base07;
            frame_color = base00 + "80";
            timeout = 0;
        };

        shortcuts = {
            close = "ctrl+space";
            close_all = "ctrl+shift+space";
        };
    };
}