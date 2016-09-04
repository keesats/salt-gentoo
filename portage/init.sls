# Portage configuration files

/etc/portage/make.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/{{ salt['grains.get']('hw_type') }}/etc/portage/make.conf
    - require:
      - file: /etc/portage/package.accept_keywords
      - file: /etc/portage/package.keywords
      - file: /etc/portage/package.license
      - file: /etc/portage/package.mask
      - file: /etc/portage/package.use
      - file: /var/lib/layman/make.conf

/etc/portage/package.accept_keywords:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/portage/package.accept_keywords
    - template: jinja

/etc/portage/package.keywords:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/portage/package.keywords
    - template: jinja
 
/etc/portage/package.license:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/portage/package.license
    - template: jinja

/etc/portage/package.mask:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/portage/package.mask
    - template: jinja

/etc/portage/package.use:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/portage/package.use
    - template: jinja
