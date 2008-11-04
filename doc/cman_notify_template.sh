#!/bin/bash

# This is a simple template that can be used as reference
# for notification scripts. Note: notification scripts need
# to be executable in order for cman_notify to run them.

# Set the path for the commands you expect to execute!
# cmannotifyd does not set any for you.

PATH=/sbin:/bin:/usr/sbin:/usr/bin:/usr/local/sbin:/usr/local/bin

# define a simple wrapper to echo
my_echo() {
	echo $@ > $OUT
}

# set the default output to null.
OUT="/dev/null"

# verify if you are running in debuggin mode
if [ "$CMAN_NOTIFICATION_DEBUG" = "1" ]; then
	# in debuggin mode, we want to see the whole output somewhere
	OUT="/var/log/cluster/file.log"
	my_echo "debugging is enabled"
fi

# parse the notification we received.
case "$CMAN_NOTIFICATION" in
	CMAN_REASON_CONFIG_UPDATE)
		# we received a configuration change
		my_echo "replace me with something to do"
	;;
	CMAN_REASON_STATECHANGE)
		# we received a status change. A node might have left or joined
		# the cluster
		my_echo "replace me with something to do"
	;;
	CMAN_REASON_TRY_SHUTDOWN)
		# we received a shutdown request. It means that cman might go
		# offline very soon.
		my_echo "replace me with something to do"
	;;
	*)
		# we received an unknown notification.
		my_echo "no clue of what to do with this"
	;;
esac

exit 0
