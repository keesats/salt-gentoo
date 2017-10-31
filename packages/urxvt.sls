{% if grains['hw_function'] == 'client' %} #If client, not server

x11-terms/rxvt-unicode:
  pkg.installed:
    - name: x11-terms/rxvt-unicode
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first

/home/{{ salt['grains.get']('default_user') }}/.Xresources: # urxvt theme
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 755
    - source: salt://files/home/default_user/.Xresources
    - require:
      - pkg: x11-terms/rxvt-unicode

/usr/share/fonts/Roboto Mono for Powerline.ttf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/usr/share/fonts/Roboto Mono for Powerline.ttf
    - require:
      - pkg: x11-terms/rxvt-unicode

/usr/share/fonts/Roboto Mono Bold for Powerline.ttf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/usr/share/fonts/Roboto Mono Bold for Powerline.ttf
    - require:
      - pkg: x11-terms/rxvt-unicode

{% endif %}
