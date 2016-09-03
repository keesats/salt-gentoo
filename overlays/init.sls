# Portage configuration files

/var/lib/layman/make.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/all/var/lib/layman/make.conf
