{ pkgs ? import <nixpkgs> {}, ...}:

{
    enable = true;
    package = (pkgs.picom.overrideAttrs (super: {
        src = pkgs.fetchFromGitHub {
            owner = "ibhagwan";
            repo = "picom";
            rev = "60eb00ce1b52aee46d343481d0530d5013ab850b";
            sha256 = "1m17znhl42sa6ry31yiy05j5ql6razajzd6s3k2wz4c63rc2fd1w";
        };
    }));

    blur = true;
    blurExclude = [
        "window_type = 'dock'"
        "window_type = 'desktop'"
        "_GTK_FRAME_EXTENTS@:c"
    ];

    inactiveOpacity = "0.7";

    fade = true;
    fadeDelta = 20;
    fadeSteps = [ "1" "1" ];

    extraOptions = ''
    blur: {
        method = "dual_kawase";
        strength = 10;
        background = false;
        background-frame = false;
        background-fixed = false;
    }

    corner-radius = 25.0;
    rounded-corners-exclude = [
        "window_type = 'tooltip'",
        "window_type = 'dock'",
        "window_type = 'dnd'",
        "window_type = 'popup_menu'",
        "window_type = 'dropdown_menu'",
        "_GTK_FRAME_EXTENTS@:c",
        "_NET_WM_STATE@:32a *= '_NET_WM_STATE_HIDDEN'"
    ];
    '';
}
