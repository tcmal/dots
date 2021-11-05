{ config, pkgs, ... }@args:

let scheme = (import ../schemes/blueish.nix args);
in {
    imports = [
        <home-manager/nixos>
        (import ../roles/de-laptop.nix customConfig)
        (import ../roles/programs.nix customConfig)
        /etc/nixos/hardware-configuration.nix
    ];
    
    nix.binaryCaches = [
        "https://hydra.iohk.io"
    ];
    nix.binaryCachePublicKeys = [
        "iohk.cachix.org-1:DpRUyj7h7V830dp/i6Nti+NEO2/nhblbov/8MW7Rqoo="
        "hydra.iohk.io:f/Ea+s+dFdN+3Y/G+FDgSq+a5NEWhJGzdjvKNGv0/EQ="
    ];

    nixpkgs.config = {
        allowUnfree = true;
    };

    # Networking
    networking.hostName = "vega"; # "The Ion Catapult is designed to use only approved UAC ammunition."
    networking.networkmanager.enable = true;
    
    # Locale
    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";
    services.xserver.layout = "gb";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "uk";
    };

    # Bootloader options
    boot.loader.systemd-boot.configurationLimit = 2;
    boot.loader.systemd-boot.editor = false;
    boot.loader.timeout = 0;

	environment.etc.hosts.mode = "0644";

    # Drivers, boot options, etc. are all in hardware-configuration.nix

    boot.supportedFilesystems = [ "ntfs" ];
}
