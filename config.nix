{ config, pkgs, ... }:

{
  imports =
    [ 
      ./hardware-configuration.nix
      ./networking.nix
      ./env-config.nix
    ];

###
# Host System Config
###
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.efi.efiSysMountPoint = "/boot/efi";

  # Setup keyfile
  boot.initrd.secrets = {
    "/crypto_keyfile.bin" = null;
  };
  
  system.stateVersion = "22.11";

  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";
  
###
# Tuning
###
boot.cleanTmpDir = true;

###
# System Wide Service
###
  virtualisation.docker.enable = true;
  services.printing.enable = true;

###
# Sound Subsystem
###
  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

###
# System Wide Packages
###
  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    wireguard-tools
    libwebp
    exfat
    firefox
    xfce.xfce4-terminal
    gnome.file-roller
    gnome.nautilus
    gnome.simple-scan
  ];

  fonts.fonts = with pkgs; [
    source-code-pro dejavu_fonts liberation_ttf vistafonts corefonts
    cantarell-fonts fira fira-mono fira-code
  ];

  services.udev.packages = with pkgs; [
  # Enable Android udev rules
  # This is needed so that the android device nodes in /dev have
  # the correct access levels (they will be managed by systemd-logind/udevd)
  android-udev-rules
  ];
}
