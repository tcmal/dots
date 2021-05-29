# Materia theme with custom base16 palette
# Modified from https://gitlab.com/rycee/nur-expressions

{ colours, pkgs, lib, ... }:

pkgs.stdenv.mkDerivation rec {
    pname = "materia-theme";
    version = "20200916";

    src = pkgs.fetchFromGitHub {
        owner = "nana-4";
        repo = pname;
        rev = "v${version}";
        sha256 = "0qaxxafsn5zd2ysgr0jyv5j73360mfdmxyd55askswlsfphssn74";
    };

    nativeBuildInputs = with pkgs; [
        meson
        ninja
        sassc
        bc
        (resvg.overrideAttrs (old: {
            postInstall = ''
                ln -s $out/bin/resvg $out/bin/rendersvg
            '';
        }))
    ];

    buildInputs = with pkgs; [
        gnome3.gnome-themes-extra
        gdk-pixbuf
        librsvg
        gtk-engine-murrine
        
    ];

    dontBuild = true;

    # Fixes problem "Fontconfig error: Cannot load default config file"
    FONTCONFIG_FILE = pkgs.makeFontsConf { fontDirectories = [ pkgs.cantarell-fonts ]; };

    theme = lib.generators.toKeyValue { } {
        # Color selection copied from
        # https://github.com/pinpox/nixos-home/blob/1cefe28c72930a0aed41c20d254ad4d193a3fa37/gtk.nix#L11
        ACCENT_BG = (builtins.substring 1 6 colours.base0B);
        ACCENT_FG = (builtins.substring 1 6 colours.base00);
        BG = (builtins.substring 1 6 colours.base00);
        BTN_BG = (builtins.substring 1 6 colours.base02);
        BTN_FG = (builtins.substring 1 6 colours.base06);
        FG = (builtins.substring 1 6 colours.base05);
        HDR_BG = (builtins.substring 1 6 colours.base02);
        HDR_BTN_BG = (builtins.substring 1 6 colours.base01);
        HDR_BTN_FG = (builtins.substring 1 6 colours.base05);
        HDR_FG = (builtins.substring 1 6 colours.base05);
        MATERIA_SURFACE = (builtins.substring 1 6 colours.base02);
        MATERIA_VIEW = (builtins.substring 1 6 colours.base01);
        MENU_BG = (builtins.substring 1 6 colours.base02);
        MENU_FG = (builtins.substring 1 6 colours.base06);
        SEL_BG = (builtins.substring 1 6 colours.base0D);
        SEL_FG = (builtins.substring 1 6 colours.base0E);
        TXT_BG = (builtins.substring 1 6 colours.base02);
        TXT_FG = (builtins.substring 1 6 colours.base06);
        WM_BORDER_FOCUS = (builtins.substring 1 6 colours.base05);
        WM_BORDER_UNFOCUS = (builtins.substring 1 6 colours.base03);

        MATERIA_COLOR_VARIANT = "dark";
        MATERIA_STYLE_COMPACT = "True";
        UNITY_DEFAULT_LAUNCHER_STYLE = "False";
    };

    passAsFile = [ "theme" ];

    mesonFlags = [
        "-Dgnome_shell_version=${lib.versions.majorMinor pkgs.gnome.gnome-shell.version}"
        "-Dtheme_name=Materia-Base16"
    ];

    postPatch = ''
        patchShebangs .
    '';
    
    postInstall = ''
        rm $out/share/themes/*/COPYING
    '';

    buildPhase = ''
        export HOME="$NIX_BUILD_ROOT"
        alias rendersvg=resvg
        ./change_color.sh -t . -o Materia-Base16 "$themePath"
    '';
}
