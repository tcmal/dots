{ pkgs, ... }:

let
    extensions = (with pkgs.vscode-extensions; [
        # Languages
        bbenoist.Nix
        ms-python.python
        haskell.haskell
        justusadam.language-haskell
        matklad.rust-analyzer
        tamasfe.even-better-toml

        # Utils
        yzhang.markdown-all-in-one
        coenraads.bracket-pair-colorizer-2
        eamodio.gitlens
        gruntfuggly.todo-tree
        vadimcn.vscode-lldb

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
        {
            name = "preview-pdf";
            publisher = "analytic-signal";
            version = "0.0.3";
            sha256 = "c83f26bef3b0714c97d8b2f3f8dc76d8f2a790f14defe076c79cbb037f7fb800";
        }
        {
            name = "beautify";
            publisher = "HookyQR";
            version = "1.5.0";
            sha256 = "b1480742dbc8369aa10f348d7d27c589e6d9bd7d00e62e5255903fdeb67213b0";
        }
    ];
in pkgs.vscode-with-extensions.override {
    vscodeExtensions = extensions;
}