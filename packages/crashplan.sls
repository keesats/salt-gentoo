# Checks to see if CrashPlan has been installed by checking existence
# of directory. If so, it updates the init.d script to match Gentoo's
# OpenRC naming convention, as opposed to the Debian init format, by
# using the referenced source file.

{% if salt['file.directory_exists' ]('/usr/local/crashplan') %}

/etc/init.d/crashplan:
  file.managed:
    - user: root
    - group: root
    - mode: 755
    - source: salt://files/all/etc/init.d/crashplan

{% endif %}
