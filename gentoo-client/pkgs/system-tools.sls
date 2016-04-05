pkgs-system-tools: #Installs Gentoo system tools
  pkg.installed:
    - pkgs:
      - app-arch/unrar #Works with RAR files
      - app-arch/unzip #Works with ZIP files
      - app-arch/xz-utils #Works with XZ files
      - sys-fs/ncdu #Disk usage analyzer
      - sys-process/htop
    - require:
      - pkg: pkgs-base #Require base pkgs first
