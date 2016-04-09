# Installs awesome-wm & other components

{% if grains['desktop_type'] == 'awesome-wm' %} #If running awesome-wm

x11-wm/awesome:
  pkg.installed:
    - name: x11-wm/awesome
    - require:
      - file: /etc/slim.conf

/home/blankford/.config/awesome/rc.lua:
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/rc.lua
    - require:
      - pkg: x11-wm/awesome

app-admin/conky:
  pkg.installed:
    - name: app-admin/conky
    - require:
      - file: /home/blankford/.config/awesome/rc.lua

/home/blankford/.conkyrc:
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.conkyrc
    - require:
      - pkg: app-admin/conky

/home/blankford/.xinitrc: #Sets up xinit config file
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 644
    - source: salt://files/all/home/blankford/.xinitrc_awesome-wm
    - require:
      - file: /home/blankford/.conkyrc

{% endif %}
