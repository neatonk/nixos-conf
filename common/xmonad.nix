# xmonad desktop config
{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    haskellPackages.ghc
    haskellPackages.haskellPlatform
  ];

  environment.x11Packages = with pkgs; [
    dmenu # for app launcher
    feh # for background image
    haskellPackages.xmonad
    haskellPackages.xmonadContrib
    haskellPackages.xmonadExtras
    scrot # for screenshot
  ];

  services.xserver = {
    windowManager = {
      xmonad.enable = true;
      default = "xmonad";
    };

    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
  };
}
