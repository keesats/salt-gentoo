pkgs-network-tools: #Installs Gentoo network tools
  pkg.installed:
    - pkgs:
      - net-analyzer/mtr
      - net-analyzer/nmap
      - net-analyzer/wireshark
      - net-dialup/minicom #Serial access
      - net-dns/bind-tools #Contains dig, nslookup, etc.
      - net-ftp/atftp #TFTP server
      - net-misc/ntp
      - net-misc/taylor-uucp #Serial/USB access in Pac Manager
      - net-misc/telnet-bsd #Telnet client
      - net-misc/whois
    - require:
      - pkg: pkgs-base #Require base pkgs first
