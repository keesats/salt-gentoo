# BitTorrent Sync

net-p2p/bittorrent-sync:
  pkg.installed:
    - name: net-p2p/bittorrent-sync
    - require:
      - pkg: pkgs-base

/opt/btsync/config:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://files/opt/btsync/config
    - template: jinja
    - require:
      - pkg: net-p2p/bittorrent-sync

/etc/init.d/btsync:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://files/etc/init.d/btsync
    - require:
      - pkg: net-p2p/bittorrent-sync

btsync-service:
  service.running:
    - name: btsync
    - enable: True
    - reload: True
    - watch:
      - pkg: net-p2p/bittorrent-sync
      - file: /opt/btsync/config
      - file: /etc/init.d/btsync
