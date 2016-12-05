# Settings to customize default user shell

/home/{{ salt['grains.get']('default_user') }}/.bash_profile: # Loads custom .bash_profile config
  file.managed:
    - user: {{ salt['grains.get']('default_user') }}
    - group: {{ salt['grains.get']('default_user') }}
    - mode: 644
    - source: salt://files/home/default_user/.bash_profile
