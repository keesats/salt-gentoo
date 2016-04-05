b18/gentoo-client-salt
==============

##Introduction##
This is a repository that configures a standalone Salt-Minion (masterless) on Gentoo for the purpose of system configuration 
and packages that should be installed. I built this for myself in order to simplify the process of building or re-building 
Gentoo clients, but anyone is welcome to use it. There is no need to start any services at boot, or even at all, as this
configuration assumes a masterless minion. To apply the state configuration, simply put all of this configuration into
/srv/salt and then run a salt-call for your local highstate at any time as follows:
> \# sudo salt-call --local state.highstate

##About##
This configuration is designed to build a Gentoo GNU/Linux AMD64 client workstation. The install as a whole includes a
base Gentoo installation, and XFCE as the working desktop environment. Other applications that are part of my client
build are included as well, but that's the foundation of the setup.

##Hardware##
This Gentoo configuration has been written from such a foundation as to remain hardware agnostic over time. Specific 
configuration sets are included at this time for the following hardware types and form factors:

###Types###
- HP EliteBook 740

###Form Factor###
- Laptop

These fuctions are controlled via statically set Salt grains. In order to utilize the required settings for these, you
will need to manually set these grains in your /etc/salt/minion file after emerging app-admin/salt. As an example,
update the grains section as follows:

```bash
grains:
  hw_type: hp-elitebook-740
  hw_factor: laptop
```

Feel free to look through the SLS files to see the relevant configurations for each of these. This should grow over
time as I personally use more hardware with Gentoo/SaltStack.
