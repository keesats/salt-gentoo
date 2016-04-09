# Sets up basic printing functionality

{% if grains['hw_function'] == 'client' %} #If client, not server

net-print/cups: #Printing support
  pkg.installed:
    - name: net-print/cups
    - require:
      - file: /etc/slim.conf #Ensures Slim is installed first

cupsd: # Ensure cupsd starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: net-print/cups

{% endif %}
