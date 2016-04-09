{% if grains['hw_function'] == 'client' %} #If client, not server

media-video/handbrake:
  pkg.installed:
    - name: media-video/handbrake
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first

{% endif %}
