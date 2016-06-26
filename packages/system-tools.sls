pkgs-system-tools: #Installs Gentoo system tools
  pkg.installed:
    - pkgs:
      - app-arch/unrar #Works with RAR files
      - app-arch/unzip #Works with ZIP files
      - app-arch/xz-utils #Works with XZ files
      - sys-apps/pciutils
      - sys-fs/ncdu #Disk usage analyzer
      - sys-process/htop
{% if grains['hw_factor'] == 'laptop' %} #If laptop
      - x11-apps/xbacklight #Backlight levels
{% endif %}
{% if grains['hw_function'] == 'client' %} #If client, not server
      - app-editors/mousepad #Text editor
      - app-text/qpdfview #PDF viewer
      - media-gfx/gpicview #Photo viewer
      - xfce-extra/xfce4-screenshooter #Takes screenshots
      - x11-misc/xlockmore #Screensavers
      - x11-terms/xfce4-terminal #Terminal emulator
{% endif %}
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first
