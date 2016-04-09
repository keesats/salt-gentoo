{% if grains['hw_function'] == 'client' %} #If client, not server
www-client/google-chrome:
  pkg.installed:
    - name: www-client/google-chrome
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first
{% endif %}
