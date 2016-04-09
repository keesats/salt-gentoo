{% if grains['hw_function'] == 'client' %} #If client, not server

app-office/libreoffice:
  pkg.installed:
    - name: app-office/libreoffice
    - require:
      - file: /etc/slim.conf #Ensures Slim is loaded first

{% endif %}
