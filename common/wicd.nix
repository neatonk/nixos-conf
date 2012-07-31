# wicd config
{...}:

{
  networking = {
    useDHCP = false;         # Don't run dhclient on wlan0
    wireless.enable = false; # Don't run wpa_supplicant
    wicd.enable = true;
  };
}