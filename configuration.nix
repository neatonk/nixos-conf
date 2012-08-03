{ config, pkgs, ... }:

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
    #./common/xfce.nix
    
    ## Hardware
    ./lenovo-t410.nix
  ];

  time.timeZone = "America/Chicago";

  environment = { 
    systemPackages = with pkgs; [
      emacs
      jackaudio
      jre
      MPlayer
      vim
    ];
    x11Packages = with pkgs; [
      libreoffice          # docs, spreadsheets, etc.
      
      # xfce
      gtk                  # To get GTK+'s themes
      gnome.gnomeicontheme # more icons
      hicolor_icon_theme   # icons for thunar
      shared_mime_info
      
      xfce.exo
      xfce.gtk_xfce_engine
      xfce.gvfs            # auto mounting
      xfce.libxfce4ui
      xfce.libxfcegui4
      xfce.thunar          # file manager
      xfce.thunar_volman   # auto mounting
      xfce.xfceutils       # this should be deleted
      xfce.xfce4icontheme  # for thunar
      xfce.xfce4settings
      xfce.xfconf
      
      zathura              # pdf viewer
    ];
  
    # /var/run/current-system/sw/etc/profile
    shellInit = ''
      # ===================================
      # SYSTEM WIDE CONFIGURATION GOES HERE
      # ===================================
      # Set GTK_PATH so that GTK+ can find the Xfce theme engine.
      export GTK_PATH=${pkgs.xfce.gtk_xfce_engine}/lib/gtk-2.0
      
      # Set GTK_DATA_PREFIX so that GTK+ can find the Xfce themes.
      export GTK_DATA_PREFIX=${config.system.path}

      # Set GIO_EXTRA_MODULES so that gvfs works.
      export GIO_EXTRA_MODULES=${pkgs.xfce.gvfs}/lib/gio/modules

      # Launch xfce settings daemon.
      xfsettingsd &
      # ===================================
    '';

    pathsToLink =
      [ "/share/xfce4" "/share/themes" "/share/mime" "/share/desktop-directories"];
  };

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
#      clearlyU
#      cm_unicode
       dejavu_fonts
#       freefont_ttf
#       gentium
       inconsolata
       liberation_ttf
#       libertine
#       lmodern
#       mph_2b_damase
#       oldstandard
#       theano
#       tempora_lgc
       terminus_font
       ttf_bitstream_vera
#       ucsFonts
#       unifont
       vistafonts
#       wqy_zenhei
    ];
  };
}