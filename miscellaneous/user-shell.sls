# Settings to customize user shell

/home/blankford/.bashrc: #Loads custom .bashrc config
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 644
    - source: salt://files/all/home/blankford/.bashrc

/home/blankford/.bash_profile: # Loads custom .bash_profile config
  file.managed:
    - user: blankford
    - group: blankford
    - mode: 644
    - source: salt://files/all/home/blankford/.bash_profile
