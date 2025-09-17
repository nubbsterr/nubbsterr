{ config, lib, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Use grub to dual-boot.
  boot.loader.systemd-boot.enable = false;
  boot.loader.grub = {
    enable = true;
    device = "nodev";
    efiSupport = true;
    useOSProber = true;
  }; 
  boot.loader.efi.canTouchEfiVariables = true;

  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_latest;

  networking.hostName = "nixos-btw"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.
  networking.networkmanager.enable = true;  # Easiest to use and most distros use this by default.

  time.timeZone = "Canada/Eastern";

  services.xserver = { 
    enable = true;
    windowManager.i3 = {
      enable = true;
      extraPackages = with pkgs; [
	    i3status
        i3blocks
	    i3lock
	    xss-lock
      ];
    };
  };

  services.displayManager.ly.enable = true;
  services.picom.enable = true;
  programs.i3lock.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;

  services.pipewire = {
    enable = true;
    pulse.enable = true;
  };

  users.users.nubb = {
    isNormalUser = true;
    extraGroups = [ "wheel" ]; # Enable ‘sudo’ for the user.
    packages = with pkgs; [
      tree
    ];
  };

  # Allow unfree to get binaryninja, see package list below
  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim 
    wget
    nitrogen
    brave
    rofi
    kitty
    obsidian
    git
    redshift
    bat
    btop
    vesktop # modified discord client, testing for a bit
    flameshot # screenshot tool
    dunst # notif daemon
    libnotify # to use notify-send to make notifs
    rclone # to sync local folders to drive
  ];

  # Install some extra fonts; chinese/korean/JP and emojis
  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk-sans
    noto-fonts-emoji
    nerd-fonts.noto
  ];

  system.stateVersion = "25.05";
}

