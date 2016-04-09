{% if grains['hw_function'] == 'client' %} #If client, not server
media-video/handbrake:
  pkg.installed:
    - name: media-video/handbrake
    - require:
      - pkg: xfce-extras #Ensures XFCE is loaded first
{% endif %}
