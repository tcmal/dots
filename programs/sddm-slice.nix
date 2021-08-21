# Rofi menu for power management.

{ pkgs ? import <nixpkgs> {}, ... }:

let stdenv = pkgs.stdenv;
    qt = pkgs.libsForQt514.qt5;
in stdenv.mkDerivation rec {
    pname = "slice-sddm-theme";
    version = "1.5.1";
    src = pkgs.fetchFromGitHub {
        owner = "RadRussianRus";
        repo = "sddm-slice";
        rev = "${version}";
        sha256 = "0b2ga0f4z61h7hfip2clfqdvr6friix1a8q6laiklfq7d4rm236l";
    };

    buildInputs = [ qt.qtbase qt.qtgraphicaleffects ];
    propagatedBuildInputs = [ qt.qtgraphicaleffects ];
    nativeBuildInputs = [ qt.wrapQtAppsHook ];

    installPhase = ''
        mkdir -p $out/slice-sddm-theme
        mv * $out/slice-sddm-theme
    '';
}