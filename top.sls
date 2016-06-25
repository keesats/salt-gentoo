# b18/salt-gentoo top.sls

base:
  '*':
    - miscellaneous
    - packages
    - portage
    - system
