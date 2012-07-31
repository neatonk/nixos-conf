# i3 desktop config
{ pkgs, ... }:

{
  environment.x11Packages = with pkgs; [
    dmenu # for app launcher
    feh # for background image
    i3lock # screen lock
    i3status # sys info
    scrot # for screenshot
    
    # xorg.utilmacros
    # xorg.xcursorgen
    # xorg.xcursorthemes
  ];

  services.xserver = {
    windowManager = {
      i3.enable = true;
      default = "i3";
    };

    displayManager = {
      sessionCommands = ''
        i3status &
      '';
    };
    
    desktopManager = {
      default = "none";
      xterm.enable = false;
    };
  };
}