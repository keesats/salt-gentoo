b18/salt-gentoo
==============

##Introduction##
This is a repository that configures a standalone Salt-Minion (masterless) on Gentoo GNU/Linux. I built this for
myself in order to simplify the process of building or re-building Gentoo machines, but anyone is welcome to use it.
There is no need to start any services at boot, or even at all, as this configuration assumes a masterless minion.
To apply the state configuration, simply put all of this configuration into /srv/salt and then run a salt-call for
your local highstate at any time as follows:
> \# sudo salt-call --local state.highstate

##Overlays##
This configuration also sets up a local layman overlay called "b18", that resides in /srv/salt/overlays/b18. This
overlay contains installs for the following packages that aren't offered in the native Gentoo Portage tree:
- Insync Google Drive Client 1.3.12.36116 (Updated 2016-10-18)
- Pac Manager 4.5.5.7 (Updated 2016-06-23)
- Plex Media Server 1.2.2.2857-d34b464 (Updated 2016-10-18)

There is nothing you'll need to do to install or utilize these packages, other than simply applying the Salt state
to the machine you're working on, and then install the package. Eg: emerge -av net-misc/insync

##Details##
This configuration is designed to build Gentoo GNU/Linux machines. The install as a whole includes basic applications
and things get added on top dependent on the scenario (laptop, desktop, type of hardware, etc.) This set of configurations
was designed to remain agnostic in regards to the type of form factor (laptop, desktop), type of hardware (HP, Dell), or
the function (server, client). This design will continue to shape over time as config is added.

##Grain Variabilization##
This entire Salt configuration is built to be highly variable-ized and applicable in any use case that I've personally run
into. The configuration isn't perfect, but it will continue to grow over time as I set up more and more Gentoo machines.
All of the configuration that gets applied to your machines from this Salt configuration will be based on statically set
grain values that you configure in your /etc/salt/minion file. See below for which values the configuration expects to be
set in order to do its job. Looking through the various states to see how they're applied will also help the configs make
more sense.

###default_user###
- useraccount1 [Enter your default user account here]

###desktop_type###
- awesome-wm (Awesome tiling window manager)
- mate (MATE desktop)
- none (No desktop environment)
- xfce (XFCE4)

###hw_factor###
- desktop (Desktop)
- laptop (Laptop features)

###hw_function###
- client (A client node)
- server (A server node)

###hw_type###
- hp-elitebook-740
- hp-elitebook-850
- super-micro

###ip_type###
- dhcp
- static

###net_dns###
- 1.1.1.1 [IP address of your DNS server, if using static]

###net_interface###
- eth0 [Enter your network interface name here]

###net_ip###
- 1.1.1.100 [Static IP address of your machine, if using static]

###net_mask###
- 255.255.255.0 [Subnet mask of your machine, if using static]

###net_gw###
- 1.1.1.1 [IP address of your default gateway, if using static]

###net_type###
- wired
- wireless

These fuctions are controlled via statically set Salt grains. In order to utilize the required settings for these, you
will need to manually set these grains in your /etc/salt/minion file after emerging app-admin/salt. As an example,
update the grains section as follows:

```bash
grains:
  default_user: myuseraccount
  desktop_type: xfce
  hw_factor: laptop 
  hw_function: client
  hw_type: hp-elitebook-850
  ip_type: dhcp
  net_type: wireless
```
