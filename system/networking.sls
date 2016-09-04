# Sets up networking.

{% if grains['hw_function'] == 'client' %} #If client, not server

net-misc/networkmanager: #Installs NetworkManager
  pkg.installed:
    - name: net-misc/networkmanager
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first

net-misc/networkmanager-vpnc: #Installs NetworkManager vpnc plugin
  pkg.installed:
    - name: net-misc/networkmanager-vpnc
    - require:
      - pkg: net-misc/networkmanager

gnome-extra/nm-applet: #GUI for Network Manager
  pkg.installed:
    - name: gnome-extra/nm-applet
    - require:
      - pkg: net-misc/networkmanager

NetworkManager: # Ensure NetworkManager starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: net-misc/networkmanager

net-wireless/wireless-tools: #Installs wireless-tools
  pkg.installed:
    - name: net-wireless/wireless-tools
    - require:
      - pkg: net-misc/networkmanager

{% if grains['hw_type'] == 'hp-elitebook-740' %} #If an HP EliteBook 740

sys-firmware/b43-firmware: #Broadcom firmware for b43 LP PHY
  pkg.installed:
    - name: sys-firmware/b43-firmware
    - require:
      - pkg: net-wireless/wireless-tools

net-wireless/broadcom-sta: #Broadcom Linux device driver
  pkg.installed:
    - name: net-wireless/broadcom-sta
    - require:
      - pkg: sys-firmware/b43-firmware

/etc/modprobe.d/blacklist.conf: #Blacklists kernel modules that cause wifi to fail
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/{{ salt['grains.get']('hw_type') }}/etc/modprobe.d/blacklist.conf
    - require:
      - pkg: net-wireless/broadcom-sta

{% endif %}

/etc/conf.d/net: #Network config file
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://files/etc/conf.d/net

{% endif %}
