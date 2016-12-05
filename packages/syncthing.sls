# SyncThing

net-p2p/syncthing:
  pkg.installed:
    - name: net-p2p/syncthing
    - require:
      - pkg: pkgs-base

syncthing-service:
  service.enabled:
    - name: syncthing
    - enable: True
    - reload: True
    - watch:
      - pkg: net-p2p/syncthing
