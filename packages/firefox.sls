{% if grains['hw_function'] == 'client' %} #If client, not server

www-client/firefox:
  pkg.installed:
    - name: www-client/firefox
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first

{% endif %}
