# Manual wireless networking with wpa-gui
{ pkgs, ... }:

{
  environment.x11Packages = [ pkgs.wpa_supplicant_gui ];

  networking = {
    wireless.enable = true;
    wireless.interfaces = [ "wlan0" ];
    wireless.userControlled.enable = true;
  };
}