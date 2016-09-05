# Sickrage

sickrage-git:
  git.latest:
    - name: https://github.com/SickRage/SickRage.git
    - rev: master
    - force_reset: True
    - target: /opt/sickrage/
    - require:
      - pkg: pkgs-base

/etc/conf.d/sickrage:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/conf.d/sickrage
    - template: jinja
    - require:
      - git: sickrage-git

/etc/init.d/sickrage:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://files/etc/init.d/sickrage
    - require:
      - git: sickrage-git

sickrage-service:
  service.enabled:
    - name: sickrage
    - enable: True
    - reload: True
    - watch:
      - git: sickrage-git
      - file: /etc/conf.d/sickrage
      - file: /etc/init.d/sickrage
