# Spicetify with system base16 colours and nord theme

{ pkgs, colours, ... }:

let spicetify = "${pkgs.spicetify-cli}/bin/spicetify-cli";
    spotify-unwrapped = pkgs.spotify-unwrapped;
    spiced = pkgs.stdenv.mkDerivation {
        pname = "spotify-base16";
        version = spotify-unwrapped.version;

        src = pkgs.spotify-unwrapped;
        doUnpackPhase = false;

        phases = [ "unpackPhase" "buildPhase" ];

        buildPhase = ''
        mkdir /tmp/spicetify-config
        export XDG_CONFIG_HOME=/tmp/spicetify-config
        ${spicetify} config spotify_path "$(pwd)"/share/spotify
        touch /tmp/spicetify-config/prefs
        ${spicetify} config prefs_path /tmp/spicetify-config/prefs

        echo '-------- 1'
        cat $(${spicetify} -c)

        echo '-------- 2'
        ls /tmp/spicetify-config/spicetify/Themes
        mkdir /tmp/spicetify-config/spicetify/Themes/SpicetifyDefault
        cat $colourIni > /tmp/spicetify-config/spicetify/Themes/SpicetifyDefault/color.ini
        cat $userCss > /tmp/spicetify-config/spicetify/Themes/SpicetifyDefault/user.css

        echo '-------- 3'
        ${spicetify} backup apply

        echo '-------- 4'
        ${spicetify} apply

        echo '-------- 5'
        mkdir -p $out
        sed -i "s#${spotify-unwrapped}#$out#g" ./bin/spotify
        cp -r ./* $out
        '';

        colourIni = pkgs.writeTextFile {
            name = "color.ini";
            text = ''
[Base]
main_fg                               = ${builtins.substring 1 6 colours.base06}
secondary_fg                          = ${builtins.substring 1 6 colours.base07}
main_bg                               = ${builtins.substring 1 6 colours.base00}
sidebar_and_player_bg                 = ${builtins.substring 1 6 colours.base00}
cover_overlay_and_shadow              = 000000
indicator_fg_and_button_bg            = ${builtins.substring 1 6 colours.base0C}
pressing_fg                           = ${builtins.substring 1 6 colours.base0C}
slider_bg                             = ${builtins.substring 1 6 colours.base0C}
sidebar_indicator_and_hover_button_bg = ${builtins.substring 1 6 colours.base0C}
scrollbar_fg_and_selected_row_bg      = ${builtins.substring 1 6 colours.base01}
selected_button                       = ${builtins.substring 1 6 colours.base0C}
pressing_button_fg                    = ${builtins.substring 1 6 colours.base0C}
pressing_button_bg                    = ${builtins.substring 1 6 colours.base0C}
miscellaneous_bg                      = ${builtins.substring 1 6 colours.base00}
miscellaneous_hover_bg                = ${builtins.substring 1 6 colours.base00}
preserve_1                            = ${builtins.substring 1 6 colours.base00}
            '';
        };

        userCss = ../share/spotify.css;
    };
in pkgs.spotify.override { spotify-unwrapped = spiced; }