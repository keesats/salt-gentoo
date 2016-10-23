# OpenVPN

net-misc/openvpn:
  pkg.installed:
    - name: net-misc/openvpn
    - require:
      - pkg: pkgs-base

openvpn-service:
  service.enabled:
    - name: openvpn
    - enable: True
    - reload: True
    - watch:
      - pkg: net-misc/openvpn
