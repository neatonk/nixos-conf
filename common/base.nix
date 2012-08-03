# base configuration
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    bashCompletion
    lsof # list open files (e.g. /dev/snd/*)
    tree
    tmux # screen alternative
    wget 
    which
  ];

  environment.x11Packages = with pkgs; [
    xdg_utils # default apps, etc.
    xfontsel
  ];

  services= {
    xserver = {
      enable = true;
      layout = "us";
      startOpenSSHAgent = true;
    };

    avahi.enable = true;
    locate.enable = true;
    nixosManual.showManual = true;

    # avoid bogus ssh warnings
    openssh.forwardX11 = false;
  };

  nix = {
    gc.automatic = true;  # nix-collect-garbage
    useChroot = true;     # chroot for builds
  };

  boot = {
    loader.grub = {
      enable = true;
      version = 1;
      splashImage = null;
    };
    cleanTmpDir = true;
  };  

  swapDevices = [ { label = "swap"; } ];

  networking.interfaceMonitor.enable = true;

  # Select internationalisation properties.
  i18n = {
    consoleFont = "lat9w-16";
    consoleKeyMap = "us";
    defaultLocale = "en_US.UTF-8";
  };

}
