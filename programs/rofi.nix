# Application launcher

{ scheme, config, ... }:

{
    enable = true;

    font = "Fira Mono 14";

    location = "top";
    
    extraConfig = {
        show-icons = true;
        display-drun = "";
        drun-display-format = "{name}";
    };

    theme = let mkLiteral = config.lib.formats.rasi.mkLiteral; in with scheme.colours; {
        "*" = {
            al = mkLiteral "#00000000";
            bg = mkLiteral (base00 + "88");
            se = mkLiteral base01;
            fg = mkLiteral base07;
            ac = mkLiteral base08;
        };

        # theme adapted from https://github.com/adi1090x/rofi/blob/master/1080p/launchers/colorful/style_2.rasi
        # original author: Aditya Shakya <adi1090x@gmail.com>
        "window" = {
            transparency = "real";
            background-color = mkLiteral "@bg";
            text-color = mkLiteral "@fg";
            border = mkLiteral "0px";
            border-color = mkLiteral "@ac";
            border-radius = mkLiteral "12px";
            width = mkLiteral "18%";
            location = mkLiteral "center";
            x-offset = mkLiteral "0";
            y-offset = mkLiteral "0";
        };

        "prompt" = {
            enabled = mkLiteral "true";
            padding = mkLiteral "0.30% 1% 0% -0.5%";
            background-color = mkLiteral "@al";
            text-color = mkLiteral "@bg";
        };

        "entry" = {
            background-color = mkLiteral "@al";
            text-color = mkLiteral "@bg";
            placeholder-color = mkLiteral "@bg";
            expand = mkLiteral "true";
            horizontal-align = mkLiteral "0";
            placeholder = "Search";
            padding = mkLiteral "0.10% 0% 0% 0%";
            blink = mkLiteral "true";
        };

        "inputbar" = {
            children = mkLiteral "[ prompt, entry ]";
            background-color = mkLiteral "@ac";
            text-color = mkLiteral "@bg";
            expand = mkLiteral "false";
            border = mkLiteral "0% 0% 0% 0%";
            border-radius = mkLiteral "0px";
            border-color = mkLiteral "@ac";
            margin = mkLiteral "0% 0% 0% 0%";
            padding = mkLiteral "1.5%";
        };

        "listview" = {
            background-color = mkLiteral "@al";
            padding = mkLiteral "0px";
            columns = mkLiteral "1";
            lines = mkLiteral "5";
            spacing = mkLiteral "0%";
            cycle = mkLiteral "false";
            dynamic = mkLiteral "true";
            layout = mkLiteral "vertical";
        };

        "mainbox" = {
            background-color = mkLiteral "@al";
            border = mkLiteral "0% 0% 0% 0%";
            border-radius = mkLiteral "0% 0% 0% 0%";
            border-color = mkLiteral "@ac";
            children = mkLiteral "[ inputbar, listview ]";
            spacing = mkLiteral "0%";
            padding = mkLiteral "0%";
        };

        "element" = {
            background-color = mkLiteral "@al";
            text-color = mkLiteral "@fg";
            orientation = mkLiteral "horizontal";
            border-radius = mkLiteral "0%";
            padding = mkLiteral "1% 0.5% 1% 0.5%";
        };

        "element-icon" = {
            background-color = mkLiteral "inherit";
            text-color = mkLiteral "inherit";
            horizontal-align = mkLiteral "0.5";
            vertical-align = mkLiteral "0.5";
            size = mkLiteral "32px";
            border = mkLiteral "0px";
        };

        "element-text" = {
            background-color = mkLiteral "@al";
            text-color = mkLiteral "inherit";
            expand = mkLiteral "true";
            horizontal-align = mkLiteral "0";
            vertical-align = mkLiteral "0.5";
            margin = mkLiteral "0% 0.25% 0% 0.25%";
        };

        "element selected" = {
            background-color = mkLiteral "@se";
            text-color = mkLiteral "@fg";
            border = mkLiteral "0% 0% 0% 0%";
            border-radius = mkLiteral "0px";
            border-color = mkLiteral "@bg";
        };
    };

}