{% if grains['hw_function'] == 'client' %} #If client, not server

media-video/vlc:
  pkg.installed:
    - name: media-video/vlc
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first

{% endif %}
