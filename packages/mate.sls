# Ensures that Slim is setup, and then installs the
# MATE desktop environment

{% if grains['hw_function'] == 'client' %} # If client, not server

{% if grains['desktop_type'] == 'mate' %} # If desktop environment is XFCE

mate-base/mate: # Installs MATE
  pkg.installed:
    - name: mate-base/mate
    - require:
      - file: /etc/slim.conf

{% endif %}

{% endif %}
