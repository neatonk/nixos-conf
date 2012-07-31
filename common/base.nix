# base configuration
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    bash
    bashCompletion
    fftw # libfftw3.so
    lsof # list open files (e.g. /dev/snd/*)
    tree
    tmux # screen alternative
    wget 
    which
  ];

  environment.x11Packages = with pkgs; [
    xdg_utils # default apps, etc.
    xfontsel
    xlibs.xev # for identifying x events.
    xlibs.xmodmap
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

  # chroot for builds
  nix.useChroot = true;

  boot.loader.grub = {
    enable = true;
    version = 1;
    splashImage = null;
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
