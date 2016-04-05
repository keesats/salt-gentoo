www-client/google-chrome:
  pkg.installed:
    - name: www-client/google-chrome
    - require:
      - pkg: xfce-extras #Ensures XFCE is loaded first
