# Installs awesome-wm & other components

{% if grains['hw_function'] == 'client' %} #If client, not server

{% if grains['desktop_type'] == 'awesome-wm' %} #If running awesome-wm

x11-wm/awesome: #Installs awesome-wm
  pkg.installed:
    - name: x11-wm/awesome
    - require:
      - file: /etc/slim.conf

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons: #Creates awesome config dirs
  file.directory:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - file_mode: 755
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: x11-wm/awesome

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/rc.lua: #Awesome primary config file
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/rc.lua
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/volume.lua: #Awesome volume widget
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/volume.lua
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/theme.lua: #Dremora theme file
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/theme.lua
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/background.jpg: #Dremora background
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/background.jpg
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/arrl_lr_post.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/arrl_lr_post.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/arrl_lr_pre.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/arrl_lr_pre.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/dwindle.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/dwindle.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/fairh.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/fairh.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/fairv.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/fairv.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/floating.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/floating.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/magnifier.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/magnifier.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/max.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/max.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/spiral.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/spiral.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/square_sel.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/square_sel.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/square_unsel.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/square_unsel.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/submenu.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/submenu.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/tilebottom.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/tilebottom.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/tileleft.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/tileleft.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/tile.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/tile.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/tiletop.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/tiletop.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/uselesstileleft.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/uselesstileleft.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/uselesstile.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/uselesstile.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

/home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons/uselesstiletop.png: #Icon
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.config/awesome/themes/dremora/icons/uselesstiletop.png
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/themes/dremora/icons

app-admin/conky: #Installs conky
  pkg.installed:
    - name: app-admin/conky
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.config/awesome/rc.lua

/home/{{ salt['grains.get']('default_user') }}/.conkyrc:
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/all/home/default_user/.conkyrc
    - require:
      - pkg: app-admin/conky

/home/{{ salt['grains.get']('default_user') }}/.xinitrc: #Sets up xinit config file
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 644
    - source: salt://files/all/home/default_user/.xinitrc_awesome-wm
    - require:
      - file: /home/{{ salt['grains.get']('default_user') }}/.conkyrc

{% endif %}

{% endif %}
