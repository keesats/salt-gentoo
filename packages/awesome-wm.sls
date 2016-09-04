# Installs awesome-wm & other components

{% if grains['hw_function'] == 'client' %} #If client, not server

{% if grains['desktop_type'] == 'awesome-wm' %} #If running awesome-wm

x11-wm/awesome: #Installs awesome-wm
  pkg.installed:
    - name: x11-wm/awesome
    - require:
      - file: /etc/slim.conf

/home/blankford/.config/awesome/themes/dremora/icons: #Creates awesome config dirs
  file.directory:
    - user: blankford
    - group: blankford
    - file_mode: 755
    - dir_mode: 755
    - makedirs: True
    - recurse:
      - user
      - group
      - mode
    - require:
      - pkg: x11-wm/awesome

/home/blankford/.config/awesome/rc.lua: #Awesome primary config file
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/rc.lua
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/volume.lua: #Awesome volume widget
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/volume.lua
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/theme.lua: #Dremora theme file
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/theme.lua
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/background.jpg: #Dremora background
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/background.jpg
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/arrl_lr_post.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/arrl_lr_post.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/arrl_lr_pre.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/arrl_lr_pre.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/dwindle.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/dwindle.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/fairh.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/fairh.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/fairv.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/fairv.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/floating.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/floating.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/magnifier.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/magnifier.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/max.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/max.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/spiral.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/spiral.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/square_sel.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/square_sel.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/square_unsel.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/square_unsel.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/submenu.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/submenu.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/tilebottom.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/tilebottom.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/tileleft.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/tileleft.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/tile.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/tile.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/tiletop.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/tiletop.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/uselesstileleft.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/uselesstileleft.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/uselesstile.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/uselesstile.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

/home/blankford/.config/awesome/themes/dremora/icons/uselesstiletop.png: #Icon
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 755
    - source: salt://files/all/home/blankford/.config/awesome/themes/dremora/icons/uselesstiletop.png
    - require:
      - file: /home/blankford/.config/awesome/themes/dremora/icons

app-admin/conky: #Installs conky
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

{% endif %}
