# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  boot.loader.grub = {
    enable = true;
    version = 2;
    # We configure the grub in ubuntu to point to the the entries 
    # for nixos, but nixos does not install grub itself
    device = "nodev";
  };

  ## Trying to fix the xserver with nvidia driver
  # boot.kernelParams = ["nomodeset"];

  networking = {
    hostName = "heko";
    # gave up on getting wicd to work correctly...
    networkmanager.enable = true;
  };

  # Select internationalisation properties.
  # i18n = {
  #   consoleFont = "Lat2-Terminus16";
  #   consoleKeyMap = "us";
  #   defaultLocale = "en_US.UTF-8";
  # };

  # Set your time zone.
  time.timeZone = "Europe/Paris";

  # List packages installed in system profile. To search by name, run:
  # $ nix-env -qaP | grep wget
  environment.systemPackages = with pkgs; [
    arandr
    emacs
    firefox
    gitAndTools.gitFull
    htop
    mtr
    nox
    redshift
    tree
    vim
    wavemon
    wget
    xcape
    xsel
  ];


  nixpkgs.config.allowUnfree = true;
  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  services.openssh.enable = true;

  # Enable CUPS to print documents.
  # services.printing.enable = true;


  services.xserver = {
    # Enable the X11 windowing system.
    enable = true;

    layout = "us";
    xkbOptions = "ctrl:nocaps, compose:ralt";

    # Enable the KDE Desktop Environment.
    displayManager.kdm.enable = true;
    desktopManager.kde4.enable = true;

    # AWESOME!
    #displayManager.slim.enable = true;
    #windowManager.awesome.enable = true;

    # try to get xcape working, does not work
    displayManager.sessionCommands = ''
      xcape -t 100 -e 'Control_L=Escape'
    '';

    # get the touchpad working
    synaptics = {
      enable = true;
      twoFingerScroll = true;
      palmDetect = true;
      maxSpeed = "2.0";
      accelFactor = "0.005";
    };
  };

  ## the display manager does not launch...
  # services.xserver.videoDrivers = ["nvidia" ];
  # hardware.opengl.driSupport32Bit = true;

  # This does nothing, gamma correction does not work
  services.redshift = {
    enable = false;
    latitude = "48.86";
    longitude = "2.35";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.extraUsers.chpill = {
    isNormalUser = true;
    uid = 1000;
    initialPassword = "password";
    extraGroups = [
      "wheel"
      "networkmanager"
    ];
  };


  security.sudo.wheelNeedsPassword = false;

  # The NixOS release to be compatible with for stateful data such as databases.
  system.stateVersion = "15.09";

}
