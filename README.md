b18/gentoo-client-salt
==============

###Notes###
This is a repository that configures a standalone Salt-Minion (masterless) on Gentoo for the purpose of system configuration 
and packages that should be installed. I built this for myself in order to simplify the process of building or re-building 
Gentoo clients, but anyone is welcome to use it. There is no need to start any services at boot, or even at all, as this
configuration assumes a masterless minion. To apply the state configuration, simply put all of this configuration into
/srv/salt and then run a salt-call for your local highstate at any time as follows:
> \# sudo salt-call --local state.highstate

###Hardware###
This Gentoo configuration has been written from such a foundation as to remain hardware agnostic over time. Specific 
configuration sets are included at this time for the following hardware types and functions:

##Types##
- HP EliteBook 740

##Functions##
- Laptop

These fuctions are controlled via statically set Salt grains. In order to utilize the required settings for these, you
will need to manually set these grains in your /etc/salt/minion file after emerging app-admin/salt. As an example,
update the grains section as follows:

> \grains:
> \  hw_type: hp-elitebook-740
> \  hw_factor: laptop
