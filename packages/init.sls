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
  - packages.xfce
  - packages.xorg

{% if grains['host'] == 'micro-a' %} #If client, not server
  - packages.btsync
  - packages.sabnzbd
  - packages.sickrage
{% endif %}

# Not currently used
# - packages.crashplan
