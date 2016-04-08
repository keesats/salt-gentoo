{% if grains['hw_function'] == 'client' %} #If client, not server
www-client/firefox:
  pkg.installed:
    - name: www-client/firefox
    - require:
      - pkg: xfce-extras #Ensures XFCE is loaded first
{% endif %}
