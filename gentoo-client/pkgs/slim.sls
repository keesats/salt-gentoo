# Ensures that XDM is setup and then installs
# Slim (login manager)

x11-misc/slim:
  pkg.installed:
    - name: x11-misc/slim
    - require:
      - file: /etc/conf.d/xdm

/etc/slim.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/all/etc/slim.conf
    - require:
      - pkg: x11-misc/slim