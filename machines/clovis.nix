{ config, pkgs, ... }:

let home-manager = builtins.fetchGit {
        url = "https://github.com/rycee/home-manager.git";
        rev = "22f6736e628958f05222ddaadd7df7818fe8f59d";
        ref = "release-20.09";
    };
in {
    imports = [
      (import "${home-manager}/nixos")
        ../roles/desktop.nix
        /etc/nixos/hardware-configuration.nix
    ];

    system.stateVersion = "20.09";
    nixpkgs.config = {
        allowUnfree = true;
    };
    
    environment.systemPackages = [
        pkgs.git
    ];

    networking.hostName = "clovis";
    users.mutableUsers = false;
    

    time.timeZone = "Europe/London";
    i18n.defaultLocale = "en_GB.UTF-8";
    services.xserver.layout = "gb";
    console = {
        font = "Lat2-Terminus16";
        keyMap = "uk";
    };
    
    sound.enable = true;
    hardware.pulseaudio.enable = true;

    # Drivers, boot options, etc. are all in hardware-configuration.nix
}