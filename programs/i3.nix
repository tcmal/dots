# Tiling window manager.

{ lib, terminal, menu, pkgs, colours, ... }:

{
    enable = true;
    config = let modifier = "Mod4";
                 shutdownMenu = (import ./shutdown-menu.nix) { inherit pkgs; };
                 workspaces = {
                     web = "1:";
                     term = "2:";
                     editor = "3:";
                     debug = "4:";
                     game = "5:";
                     download = "6:";
                     audio = "7:";
                     steam = "8:";
                     misc = "9:9";
                     misc2 = "10:10";
                 };
    in {
        inherit menu terminal modifier;

        fonts = [ "Roboto" "Font Awesome 5 Free" ];

        startup = [
            { command = "${pkgs.pasystray}/bin/pasystray"; always = true; }
        ];

        assigns = {
            "${workspaces.web}" = [ { class = "Firefox"; } ];
            "${workspaces.term}" = [ { class = "Alacritty"; } ];
            "${workspaces.editor}" = [ { class = "code"; } { class = "obsidian"; } ];
            "${workspaces.debug}" = [ { class = "okular"; } ];
            "${workspaces.audio}" = [ { class = "discord"; } { class = "spotify"; } ];
            "${workspaces.steam}" = [ { class = "Steam"; } ];
        };

        colors = {
            focused = {
                border = colours.base0D;
                background = colours.base0D;
                text = colours.base00;
                indicator = colours.base01;
                childBorder = colours.base01;
            };
            unfocused = {
                border = colours.base01;
                background = colours.base01;
                text = colours.base03;
                indicator = colours.base01;
                childBorder = colours.base01;
            };
            urgent = {
                border = colours.base02;
                background = colours.base08;
                text = colours.base07;
                indicator = colours.base08;
                childBorder = colours.base08;
            };
            placeholder = {
                border = colours.base02;
                background = colours.base08;
                text = colours.base07;
                indicator = colours.base08;
                childBorder = colours.base08;
            };
        };

        bars = [
            {
                fonts = [ "Font Awesome 5 Free Solid 12" "Roboto 12"];
                mode = "hide";
                workspaceNumbers = false;

                colors = {
                    background = colours.base00;
                    statusline = colours.base05;

                    activeWorkspace = {
                        background = colours.base02;
                        border = colours.base02;
                        text = colours.base07;
                    };
                    inactiveWorkspace = {
                        background = colours.base01;
                        border = colours.base01;
                        text = colours.base03;
                    };
                    focusedWorkspace = {
                        background = colours.base0C;
                        border = colours.base0D;
                        text = colours.base00;
                    };
                    urgentWorkspace = {
                        background = colours.base08;
                        border = colours.base08;
                        text = colours.base07;
                    };
                    bindingMode = {
                        background = colours.base08;
                        border = colours.base08;
                        text = colours.base07;
                    };
                };
            }
        ];

        keybindings = lib.mkOptionDefault {
            "${modifier}+Tab" = "workspace back_and_forth";

            "${modifier}+h" = "focus left";
            "${modifier}+j" = "focus down";
            "${modifier}+k" = "focus up";
            "${modifier}+l" = "focus right";
 
            "${modifier}+Shift+h" = "move left";
            "${modifier}+Shift+j" = "move down";
            "${modifier}+Shift+k" = "move up";
            "${modifier}+Shift+l" = "move right";

            "${modifier}+Return" = "exec ${menu}";
            "${modifier}+t" = "exec ${terminal}";
            "${modifier}+g" = "exec ${shutdownMenu}/bin/shutdown-menu";

            "${modifier}+a" = "focus parent";
            "${modifier}+s" = "layout stacking";
            "${modifier}+w" = "layout tabbed";

            "${modifier}+1" = "workspace ${workspaces.web}";
            "${modifier}+2" = "workspace ${workspaces.term}";
            "${modifier}+3" = "workspace ${workspaces.editor}";
            "${modifier}+4" = "workspace ${workspaces.debug}";
            "${modifier}+5" = "workspace ${workspaces.game}";
            "${modifier}+6" = "workspace ${workspaces.download}";
            "${modifier}+7" = "workspace ${workspaces.audio}";
            "${modifier}+8" = "workspace ${workspaces.steam}";
            "${modifier}+9" = "workspace ${workspaces.misc}";
            "${modifier}+0" = "workspace ${workspaces.misc2}";

            "${modifier}+Shift+1" = "move container to workspace ${workspaces.web}";
            "${modifier}+Shift+2" = "move container to workspace ${workspaces.term}";
            "${modifier}+Shift+3" = "move container to workspace ${workspaces.editor}";
            "${modifier}+Shift+4" = "move container to workspace ${workspaces.debug}";
            "${modifier}+Shift+5" = "move container to workspace ${workspaces.game}";
            "${modifier}+Shift+6" = "move container to workspace ${workspaces.download}";
            "${modifier}+Shift+7" = "move container to workspace ${workspaces.audio}";
            "${modifier}+Shift+8" = "move container to workspace ${workspaces.steam}";
            "${modifier}+Shift+9" = "move container to workspace ${workspaces.misc}";
            "${modifier}+Shift+0" = "move container to workspace ${workspaces.misc2}";

            "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +5%";
            "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -5%";
            "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";
        };

        window = {
            hideEdgeBorders = "smart";
            titlebar = false;
            border = 0;
        };
    };
}
