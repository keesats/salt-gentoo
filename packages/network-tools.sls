pkgs-network-tools: #Installs Gentoo network tools
  pkg.installed:
    - pkgs:
      - net-analyzer/mtr
      - net-analyzer/nmap
      - net-dns/bind-tools #Contains dig, nslookup, etc.
      - net-misc/ntp
      - net-misc/whois
{% if grains['hw_function'] == 'client' %} #If client, not server
      - net-analyzer/wireshark
      - net-dialup/minicom #Serial access
      - net-ftp/atftp #TFTP server
      - net-misc/taylor-uucp #Serial/USB access in Pac Manager
      - net-misc/telnet-bsd #Telnet client
{% endif %}
    - require:
      - pkg: pkgs-base #Require base pkgs first
