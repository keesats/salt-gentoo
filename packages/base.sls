pkgs-base: #Installs Gentoo base packages
  pkg.installed:
    - pkgs:
      - app-admin/sudo
      - app-admin/sysklogd
      - app-portage/gentoolkit
      - net-misc/dhcpcd
      - sys-apps/dbus
      - sys-apps/mlocate
      - sys-apps/pciutils
      - sys-auth/consolekit
      - sys-fs/cryptsetup
      - sys-kernel/genkernel
      - sys-process/cronie
    - require:
      - file: /etc/portage/make.conf
