include: 
  - packages.awesome-wm
  - packages.base
# - packages.firefox # Not installed by default
  - packages.google-chrome
  - packages.handbrake
# - packages.libreoffice # Not installed by default
  - packages.mate
  - packages.network-tools
  - packages.slim
  - packages.system-tools
  - packages.vlc
  - packages.xfce
  - packages.xorg

{% if grains['host'] == 'micro-a' %} # Match host name
  - packages.openvpn
  - packages.sabnzbd
  - packages.sickrage
  - packages.syncthing
{% endif %}

# Not currently used
# - packages.crashplan
