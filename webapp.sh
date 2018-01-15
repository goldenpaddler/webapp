#!/bin/sh

### BEGIN INIT INFO
#	Provides :			myservice
#	Required-Start			$remote_fs $syslog
#	Required-Stop			$remote_fs $syslog
#	Default-Start			2 3 4 5 
#	Default-Stop 			0 1 6
#	Short-Description		Put a short description of the service here
#	Description			Put a long description of the service here
### END INIT INFO

#Change the next three lines to suit where you install your script and what you want it called
DIR=~/webapp/
DAEMON=$DIR/app.py
DAEMON_NAME=webapp

#add any command line options for your daemon here
DAEMON_OPTS=""

#this nsxt line determines what user the script runs as
#Root generally not recommended ,but is necessary if you are using the Raspberry Pi GPIO from Python
DAEMON_USER=ec2-user

#the process id of the script when it runs is store here
PIDFILE=/var/run/$DAEMON_NAMe.pid

#. /lib/lsb/init-functions

do_start(){
	#log_daemon_msg "Start system $DAEMON_NAME daemon")
	start-stop-daemon --start --background --pidfile $PIDFILE --make-pidfile --user $DAEMON_USER  --chuid $DAEMON_USER --startas $DAEMON -- $DAEMON_OPTS
	#log_end_msg $?
}	

do_stop(){
	#log_daemon_msg("Stopping system $DAEMON_NAME daemon"
	start-stop-daemon --stop --pidfile $PIDFILE --retry 10
	#log_end_msg $?
}

case "$1" in
	start|stop)
		do_${1}
	;;

	restart|reload|force-reload)
		do_stop
		do_start
		;;	

	status)
		status_of_proc "$DAEMON_NAME" "DAEMON" && exit 0 || exit $?
		;;

	*)
		echo "Usage: /etc/init.d/$DAEMON_NAME {start|stop|restart|statuys}"
		exit 1
		;;
esac
exit 0

	
	
