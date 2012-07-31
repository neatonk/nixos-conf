# NixOS Configuration for a lenovo t410 laptop.

{ pkgs, ... }:

{ 
  boot.loader.grub.device = "/dev/sda5";

  fileSystems = [
    { # nixos
      mountPoint = "/";
      device = "/dev/sda5";
      fsType = "ext4"; 
    } 
    { # shared code/dev partition
      mountPoint = "/home/neatonk/dev/";
      label = "code"; 
    }
    { # shared media partition
      mountPoint = "/home/neatonk/media/";
      label = "media"; 
    }
  ];  

  networking.hostName = "nixpad";

  # using pm_utils
  powerManagement.enable = true;

  services = {
    xserver.synaptics = {
      enable = true;
      vertEdgeScroll = false;
      tapButtons = false;
      twoFingerScroll = true;
    };
  };

  ## Generated Hardware Configuration 
  require = [
    <nixos/modules/installer/scan/not-detected.nix>
  ];

  boot.initrd.kernelModules = [ "ehci_hcd" "ahci" "firewire_ohci" ];
  boot.kernelModules = [ "kvm-intel" ];
  boot.extraModulePackages = [ ];

  nix.maxJobs = 4;
}