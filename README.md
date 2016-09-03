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
- Insync Google Drive Client 1.3.10.36104 (Updated 2016-09-03)
- Pac Manager 4.5.5.7 (Updated 2016-06-23)
- Plex Media Server 1.1.3.2700-6f64a8d (Updated 2016-09-03)

There is nothing you'll need to do to install or utilize these packages, other than simply applying the Salt state
to the machine you're working on, and then install the package. Eg: emerge -av net-misc/insync

##About##
This configuration is designed to build Gentoo GNU/Linux machines. The install as a whole includes basic applications
and things get added on top dependent on the scenario (laptop, desktop, type of hardware, etc.) This set of configurations
was designed to remain agnostic in regards to the type of form factor (laptop, desktop), type of hardware (HP, Dell), or
the function (server, client). This design will continue to shape over time as config is added.

##Hardware##
That being said, specific configuration sets are included at this time for the following hardware types and form factors:

###Desktop Type###
- awesome-wm
- xfce

###Form Factor###
- laptop

###Function###
- client

###Type###
- hp-elitebook-740
- hp-elitebook-850

These fuctions are controlled via statically set Salt grains. In order to utilize the required settings for these, you
will need to manually set these grains in your /etc/salt/minion file after emerging app-admin/salt. As an example,
update the grains section as follows:

```bash
grains:
  desktop_type: awesome-wm
  hw_factor: laptop
  hw_function: client
  hw_type: hp-elitebook-740
```

Feel free to look through the SLS files to see the relevant configurations for each of these. This should grow over
time as I personally use more hardware with Gentoo/SaltStack.
