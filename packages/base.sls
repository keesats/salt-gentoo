pkgs-base: # Installs Gentoo base packages
  pkg.installed:
    - pkgs:
      - app-admin/sudo
      - app-admin/sysklogd
      - app-portage/gentoolkit
      - app-portage/layman # Provides overlay functionality
      - dev-vcs/git
      - net-misc/dhcpcd
      - sys-apps/mlocate
      - sys-apps/pciutils
      - sys-kernel/genkernel
      - sys-process/cronie

{% if grains['hw_function'] == 'client' %} # If client, not server

      - dev-libs/libgcrypt #Provides GnuPG crypto libraries
      - dev-libs/libmcrypt #Provides encryption algorithms
      - dev-perl/XML-Parser
      - sys-apps/dbus
      - sys-auth/consolekit
      - sys-fs/cryptsetup

{% endif %}

    - require:
      - file: /etc/portage/make.conf

{% if grains['hw_function'] == 'client' %} #If client, not server

consolekit: # Ensure consolekit starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: pkgs-base

dbus: # Ensure dbus starts at boot
  service.enabled:
    - enable: True
    - require:
      - pkg: pkgs-base

{% endif %}
