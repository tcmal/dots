{ pkgs, ... }:

derivation {
    name = "shutdown-menu";

    builder = "${pkgs.bash}/bin/bash";

    args = [ "-c" ''
        $coreutils/bin/mkdir -p $out/bin;
        ($coreutils/bin/echo "PATH=\$PATH:$i3lock/bin"; $coreutils/bin/cat $scriptFile) > $out/bin/shutdown-menu;
        $coreutils/bin/chmod +x $out/bin/shutdown-menu;
    '' ];

    coreutils = pkgs.coreutils;
    i3lock = pkgs.i3lock-fancy-rapid;
    
    scriptFile = ../share/shutdown-menu;

    system = builtins.currentSystem;
}