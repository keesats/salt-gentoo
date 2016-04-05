# Installs Xorg components that are prerequisites for
# loading XFCE and Slim.

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

/etc/conf.d/xdm:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/all/etc/conf.d/xdm
    - require:
      - pkg: x11-apps/xdm
