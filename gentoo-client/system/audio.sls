# Sets up ALSA/sound.

media-libs/alsa-lib: #Installs alsa-lib
  pkg.installed:
    - name: media-libs/alsa-lib

media-sound/alsa-utils: #Installs alsa-utils
  pkg.installed:
    - name: media-sound/alsa-utils

{% if grains['hw_type'] == 'hp-elitebook-740' %} #If an HP EliteBook 740
/etc/modprobe.d/alsa.conf: #Swaps order of sound cards in ALSA.
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/modprobe.d/alsa.conf
    - require:
      - pkg: media-libs/alsa-lib
      - pkg: media-sound/alsa-utils
{% endif %}
