{ config, pkgs, ... }:

{
  networking.networkmanager.enable = true;
  networking.hostName = "nixbert";

  networking.firewall = {  
    enable = true;
    # allowedTCPPorts = [ ];
    # allowedUDPPorts = [ ];
    # If using tailscale, enable checkReversePath
    #checkReversePath = "loose";
  };

  # services.openssh.enable = true;
  # services.tailscale.enable = true;
}

