{ lib, terminal, menu, pkgs, colours, ... }:

{
    enable = true;
    config = let modifier = "Mod4";
                 shutdownMenu = (import ./shutdown-menu.nix) { inherit pkgs; };
    in {
        inherit menu terminal modifier;

        fonts = [ "Roboto" ];

        colors = {
            focused = {
                border = colours.secondary;
                background = colours.secondary;
                text = colours.secondaryText;
                indicator = colours.secondaryText;
                childBorder = colours.secondary;
            };
            unfocused = {
                border = colours.primary;
                background = colours.primary;
                text = colours.primaryText;
                indicator = colours.primaryText;
                childBorder = colours.primaryText;
            };
            urgent = {
                border = colours.accent;
                background = colours.accent;
                text = colours.accentText;
                indicator = colours.accentText;
                childBorder = colours.accent;
            };
            placeholder = {
                border = colours.accent;
                background = colours.accent;
                text = colours.accentText;
                indicator = colours.accentText;
                childBorder = colours.accentText;
            };
        };

        bars = [
            {
                fonts = [ "Roboto" ];
                mode = "hide";

                colors = {
                    background = colours.primary;
                    statusline = colours.primaryText;
                    activeWorkspace = {
                        background = colours.secondary;
                        border = colours.secondary;
                        text = colours.secondaryText;
                    };
                    inactiveWorkspace = {
                        background = colours.primary;
                        border = colours.primary;
                        text = colours.primaryText;
                    };
                    focusedWorkspace = {
                        background = colours.secondary;
                        border = colours.secondary;
                        text = colours.secondaryText;
                    };
                    urgentWorkspace = {
                        background = colours.accent;
                        border = colours.accent;
                        text = colours.accentText;
                    };
                    bindingMode = {
                        background = colours.accent;
                        border = colours.accent;
                        text = colours.accentText;
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
        };

        window = {
            hideEdgeBorders = "smart";
            titlebar = false;
            border = 0;
        };
    };
}