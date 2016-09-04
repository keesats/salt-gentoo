#!/bin/sh
# Managed by SaltStack

# Variables
IPSET_BLACKLIST_HOST=blacklist
IPSET_BLACKLIST_NET=blacklistnet
IPSET_RESTOREFILE=$(mktemp -t emerging-ipset-update-ipsetrestorefile.XXX)
ET_FWREV_STATEFILE="/var/run/emerging-ipset-update.fwrev"
ET_FWREV_URL="http://rules.emergingthreats.net/fwrules/FWrev"
ET_FWREV_TEMP=$(mktemp -t emerging-ipset-update-fwrevtemp.XXX)
ET_FWREV_LOCAL="0"
ET_FWREV_ONLINE="0"
ET_FWRULES="http://rules.emergingthreats.net/fwrules/emerging-Block-IPs.txt"
ET_FWRULES_TEMP=$(mktemp -t emerging-ipset-update-fwrules.XXXX)
SYSLOG_TAG="EMERGING-IPSET-UPDATE"
WGET="/usr/bin/wget"
IPSET="/usr/sbin/ipset"

# Syslogging
do_log () {
        local PRIO=$1; shift;
        echo "$PRIO: $*"
        echo "$*" | logger -p "$PRIO" -t "$SYSLOG_TAG"
}

# Check executables
for i in "$WGET" "$IPSET"
do
	if ! [ -x "$i" ] 
	then
		do_log error "$i does not exist or is not executable"
		exit 1
	fi
done

# Create file if not already there
if [ ! -f $ET_FWREV_STATEFILE ]; then
    touch $ET_FWREV_STATEFILE
fi

# Check files
for i in "$IPSET_RESTOREFILE" "$ET_FWREV_STATEFILE" "$ET_FWREV_TEMP" "$ET_FWRULES_TEMP"
do
	if ! [ -w "$i" ]
        then
                do_log error "$i does not exist or is not writeable"
                exit 1
        fi
done

# Create statefile if not exists
if ! [ -f "$ET_FWREV_STATEFILE" ]; then
	echo 0 >"$ET_FWREV_STATEFILE"
fi

# Get fwrev online
if ! $WGET -O "$ET_FWREV_TEMP" -q "$ET_FWREV_URL";
then
	do_log error "can't download $ET_FWREV_URL to $ET_FWREV_TEMP"
	exit 1
fi

# More variables
ET_FWREV_ONLINE=$(cat $ET_FWREV_TEMP)
ET_FWREV_LOCAL=$(cat $ET_FWREV_STATEFILE)


if [ "$ET_FWREV_ONLINE" != "$ET_FWREV_LOCAL" ]
then
	do_log notice "Local fwrev $ET_FWREV_LOCAL does not match online fwrev $ET_FWREV_ONLINE. start update"

	if ! "$WGET" -O "$ET_FWRULES_TEMP" -q "$ET_FWRULES"
	then
		do_log error "can't download $ET_FWRULES to $ET_FWREV_TEMP"
	fi

	# Ensure that ipsets exist
	$IPSET -N $IPSET_BLACKLIST_HOST iphash --hashsize 26244 >/dev/null 2>&1
	$IPSET -N $IPSET_BLACKLIST_NET nethash --hashsize 3456 >/dev/null 2>&1

	# Ensure that temp sets do not exist
	$IPSET --destroy "${IPSET_BLACKLIST_HOST}_TEMP" >/dev/null 2>&1
	$IPSET --destroy "${IPSET_BLACKLIST_NET}_TEMP" >/dev/null 2>&1

	# Host IP Adresses
	echo "-N ${IPSET_BLACKLIST_HOST}_TEMP iphash --hashsize 26244" >>$IPSET_RESTOREFILE
	for i in $(egrep '^[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}$' "$ET_FWRULES_TEMP")
	do
		echo "-A ${IPSET_BLACKLIST_HOST}_TEMP $i" >>$IPSET_RESTOREFILE
	done

	# Network addresses
	echo "-N ${IPSET_BLACKLIST_NET}_TEMP nethash --hashsize 3456" >>$IPSET_RESTOREFILE
	for i in $(egrep '^[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}\.[[:digit:]]{1,3}/[[:digit:]]{1,2}$' "$ET_FWRULES_TEMP")
        do
                echo "-A ${IPSET_BLACKLIST_NET}_TEMP $i" >>$IPSET_RESTOREFILE
        done

	# Needed for ipset --restore
	echo "COMMIT" >>$IPSET_RESTOREFILE

	if ! ipset --restore <$IPSET_RESTOREFILE
	then
		do_log error "ipset restore failed. restorefile is $IPSET_RESTOREFILE"; exit 1;
	fi


	# Swap sets
	ipset --swap ${IPSET_BLACKLIST_HOST} ${IPSET_BLACKLIST_HOST}_TEMP
	ipset --swap ${IPSET_BLACKLIST_NET} ${IPSET_BLACKLIST_NET}_TEMP

	# Remove temp sets
	ipset --destroy ${IPSET_BLACKLIST_HOST}_TEMP
	ipset --destroy ${IPSET_BLACKLIST_NET}_TEMP

	if ! echo $ET_FWREV_ONLINE >$ET_FWREV_STATEFILE
	then
		do_log error "failed to write to fwrev statefile $ET_FWREV_STATEFILE"; exit 1;
	fi
fi

rm -f "$IPSET_RESTOREFILE" "$ET_FWRULES_TEMP" "$ET_FWREV_TEMP"

# #######################################
# #######################################

# Done pulling down ET rules into IPSet.
# Now beginning IPTables work.

# Flush current rulesets
/sbin/iptables -F

# Allow in and out, but block forward traffic
/sbin/iptables -P INPUT ACCEPT
/sbin/iptables -P OUTPUT ACCEPT
/sbin/iptables -P FORWARD DROP

# Deny inbound & outbound traffic involving IPSet rules
/sbin/iptables -I OUTPUT -m set --match-set blacklist dst -j DROP
/sbin/iptables -I OUTPUT -m set --match-set blacklistnet dst -j DROP
/sbin/iptables -I INPUT -m set --match-set blacklist src -j DROP
/sbin/iptables -I INPUT -m set --match-set blacklistnet src -j DROP
