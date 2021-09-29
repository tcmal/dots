{pkgs ? import <nixpkgs> {}}:

pkgs.i3-gaps.overrideAttrs (old: rec {
    src = pkgs.fetchFromGitHub {
        owner = "resloved";
        repo = "i3";
        rev = "b521c18ca1bca1c16d3fd69214ad3972bffc9e42";
        sha256 = "0w4akd7mkdm4xlv2ai2hyjn45f1qgzj5g6n09hrcns1zv4nffcch";
    };

    nativeBuildInputs = with pkgs; [ autoreconfHook makeWrapper installShellFiles ];

    configurePhase = ''
rm -rf build/
mkdir -p build && cd build/
../configure --prefix=$out --sysconfdir=$out/etc --disable-sanitizers
    '';

    buildPhase = ''
make
    '';
})