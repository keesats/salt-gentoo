# SABnzbd

net-nntp/sabnzbd:
  pkg.installed:
    - name: net-nntp/sabnzbd
    - require:
      - pkg: pkgs-base

sabnzbd-service:
  service.enabled:
    - name: sabnzbd
    - enable: True
    - reload: True
    - watch:
      - pkg: net-nntp/sabnzbd
