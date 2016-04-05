net-misc/networkmanager: #Installs NetworkManager
  pkg.installed:
    - name: net-misc/networkmanager
    - require:
      - pkg: xfce-extras

net-misc/networkmanager-vpnc: #Installs NetworkManager vpnc plugin
  pkg.installed:
    - name: net-misc/networkmanager-vpnc
    - require:
      - pkg: net-misc/networkmanager

NetworkManager: # Ensure NetworkManager starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: net-misc/networkmanager
