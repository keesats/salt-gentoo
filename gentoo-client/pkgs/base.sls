# Base applications for Gentoo install

gentoo-base: #Installs Gentoo base packages
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
      - sys-process/cronie
    - require:
      - file: /etc/portage/make.conf
      - file: /etc/portage/package.accept_keywords
      - file: /etc/portage/package.keywords
      - file: /etc/portage/package.license
      - file: /etc/portage/package.mask/pacmanager
      - file: /etc/portage/package.use
