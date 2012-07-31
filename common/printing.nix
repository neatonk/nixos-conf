# printing configuration
{ config, pkgs, ... }:
	
{ 
  # Install print drivers
  environment.systemPackages = with pkgs; [
    hplip # hp drivers
  ];

  # Enable CUPS to print documents.
  services.printing.enable = true;
}