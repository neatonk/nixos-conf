{ pkgs, ... }:

{
  require = [
    ./common/base.nix
    ./common/no-beep.nix
    ./common/printing.nix

    ## Networking
    #./common/wicd.nix
    ./common/wpa_supplicant.nix

    ## Window manager
    #./common/xmonad.nix
    ./common/i3.nix

    ## Desktop
    ./common/xfce.nix
    
    ## Hardware
    ./lenovo-t410.nix
  ];

  time.timeZone = "America/Chicago";

  environment.systemPackages = with pkgs; [
    # develepment
    emacs
    gitAndTools.gitFull
    jre
    leiningen
    vim

    # audio
    jackaudio
    MPlayer
  ];

  # /var/run/current-system/sw/etc/profile
  environment.shellInit = ''
    export EDITOR="emacs"
    export BROWSER="chrome"
    
    # let impure applications build/run outside of nix...
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:$HOME/.nix-profile/lib"
    export LD_LIBRARY_PATH="$LD_LIBRARY_PATH:/var/run/current-system/sw/lib"

    #export NIX_LDFLAGS="$NIX_LDFLAGS -L /var/run/current-system/sw/lib"
    #export NIX_CFLAGS_COMPILE="$NIX_CFLAGS_COMPILE -I /var/run/current-system/sw/include"
    #export PKG_CONFIG_PATH="$PKG_CONFIG_PATH:/var/run/current-system/sw/lib/pkgconfig"
  '';

  environment.x11Packages = with pkgs; [
    # internet
    #chromeWrapper
    firefoxWrapper
    #transmission
    pidgin

    # office
    libreoffice
    zathura

    # graphics
    #gimp
    #inkscape

    # audio
    qjackctl

    # engineering
    #octave
    #qucs
  ];
  
  fonts = {
    enableFontDir = true;
    enableGhostscriptFonts = true;
    extraFonts = with pkgs; [
#       andagii
#       anonymousPro
#       arkpandora_ttf
#       bakoma_ttf
#       cantarell_fonts
       corefonts
       clearlyU
       cm_unicode
#       dejavu_fonts
#       freefont_ttf
#       gentium
       inconsolata
#       liberation_ttf
#       libertine
#       lmodern
#       mph_2b_damase
#       oldstandard
#       theano
#       tempora_lgc
       terminus_font
       ttf_bitstream_vera
#       ttf_bitstream_vera_for_powerline
#       ucsFonts
#       unifont
#       vistafonts
#       wqy_zenhei
    ];
  };
}