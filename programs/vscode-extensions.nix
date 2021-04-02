{ pkgs, ... }:

let
    extensions = (with pkgs.vscode-extensions; [
        # Languages
        bbenoist.Nix
        ms-python.python
        haskell.haskell
        matklad.rust-analyzer
        tamasfe.even-better-toml

        # Utils
        yzhang.markdown-all-in-one
        coenraads.bracket-pair-colorizer-2
        eamodio.gitlens

        # Appearance
        naumovs.color-highlight
    ]) ++ pkgs.vscode-utils.extensionsFromVscodeMarketplace [
        {
            name = "nix-env-selector";
            publisher = "arrterian";
            version = "1.0.7";
            sha256 = "0e76885c9dbb6dca4eac8a75866ec372b948cc64a3a3845327d7c3ef6ba42a57";
        }
        {
            name = "discord-vscode";
            publisher = "icrawl";
            version = "5.4.0";
            sha256 = "c90c0e9542b65e27dcd32d4722fc8ab2cef7382c696412a74ea32b3604f9605a";
        }
    ];
in pkgs.vscode-with-extensions.override {
    vscodeExtensions = extensions;
}