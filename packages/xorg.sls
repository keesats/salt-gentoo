# Installs Xorg components

{% if grains['hw_function'] == 'client' %} # If client, not server

x11-base/xorg-server:
  pkg.installed:
    - name: x11-misc/slim
    - require:
      - file: /etc/portage/make.conf

x11-apps/xdm:
  pkg.installed:
    - name: x11-apps/xdm
    - require:
      - pkg: x11-base/xorg-server

/home/{{ salt['grains.get']('default_user') }}/.xinitrc: # Sets up xinit config file
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 644
    - source: salt://files/home/default_user/.xinitrc
    - template: jinja
    - require:
      - pkg: x11-apps/xdm

/etc/conf.d/xdm:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/conf.d/xdm
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.xinitrc

{% endif %}
