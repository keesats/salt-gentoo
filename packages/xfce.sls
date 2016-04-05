# Ensures that Slim is setup, and then installs all
# XFCE base/extra components.

{% if grains['hw_function'] == 'client' %} #If client not server

xfce-base/xfce4-meta: #Installs XFCE
  pkg.installed:
    - name: xfce-base/xfce4-meta
    - require:
      - file: /etc/slim.conf

/home/blankford/.xinitrc: #Sets up xinit config file
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 644
    - source: salt://files/all/home/blankford/.xinitrc
    - require:
      - pkg: xfce-base/xfce4-meta

xfce-base/thunar: #Installs XFCE file manager
  pkg.installed:
    - name: xfce-base/thunar
    - require:
      - file: /home/blankford/.xinitrc

xfce-extras: #Installs XFCE extras
  pkg.installed:
    - pkgs:
      - x11-misc/xlockmore #Screensavers
      - x11-terms/xfce4-terminal
      - x11-themes/gtk-engines-xfce
      - xfce-extra/thunar-archive-plugin
      - xfce-extra/thunar-volman
      - xfce-extra/xfce4-battery-plugin
      - xfce-extra/xfce4-mixer
      - xfce-extra/xfce4-notifyd
      - xfce-extra/xfce4-power-manager
      - xfce-extra/xfce4-sensors-plugin
      - xfce-extra/xfce4-volumed
    - require:
      - pkg: xfce-base/thunar

consolekit: # Ensure consolekit starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: xfce-extras

dbus: # Ensure dbus starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: xfce-extras

{% endif %}
