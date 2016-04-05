{% if grains['hw_function'] == 'client' %} #If client, not server
app-office/libreoffice:
  pkg.installed:
    - name: app-office/libreoffice
    - require:
      - pkg: xfce-extras #Ensures XFCE is loaded first
{% endif %}
