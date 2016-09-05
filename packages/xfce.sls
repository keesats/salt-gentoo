# Ensures that Slim is setup, and then installs all
# XFCE base/extra components.

{% if grains['hw_function'] == 'client' %} # If client, not server

{% if grains['desktop_type'] == 'xfce' %} # If desktop environment is XFCE

xfce-base/xfce4-meta: # Installs XFCE
  pkg.installed:
    - name: xfce-base/xfce4-meta
    - require:
      - file: /etc/slim.conf

/home/{{ salt['grains.get']('default_user') }}/.xinitrc: # Sets up xinit config file
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 644
    - source: salt://files/home/default_user/.xinitrc_xfce
    - require:
      - pkg: xfce-base/xfce4-meta

xfce-base/thunar: # Installs XFCE file manager
  pkg.installed:
    - name: xfce-base/thunar
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.xinitrc

xfce-extras: # Installs XFCE extras
  pkg.installed:
    - pkgs:
      - x11-misc/xlockmore # Screensavers
      - x11-themes/gtk-engines-xfce
      - xfce-extra/thunar-archive-plugin
      - xfce-extra/thunar-volman
      - xfce-extra/xfce4-battery-plugin
      - xfce-extra/xfce4-mixer
      - xfce-extra/xfce4-notifyd
      - xfce-extra/xfce4-power-manager
      - xfce-extra/xfce4-screenshooter
      - xfce-extra/xfce4-sensors-plugin
      - xfce-extra/xfce4-volumed
    - require:
      - pkg: xfce-base/thunar

{% endif %}

{% endif %}
