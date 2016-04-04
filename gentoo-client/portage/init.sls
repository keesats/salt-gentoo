# Portage configuration files

/etc/portage/make.conf:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/portage/make.conf

/etc/portage/package.accept_keywords:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/portage/package.accept_keywords

/etc/portage/package.keywords:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/portage/package.keywords

/etc/portage/package.license:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/portage/package.license

/etc/portage/package.mask/pacmanager:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/portage/package.mask/pacmanager

/etc/portage/package.use:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - source: salt://gentoo-client/files/{{ salt['grains.get']('hw_type') }}/etc/portage/package.use
