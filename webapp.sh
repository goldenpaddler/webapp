#!/bin/sh

#chkconfig: 2345 80 95
#description: webapp

### BEGIN INIT INFO
#	Provides :			webapp
#	Required-Start			$remote_fs $syslog
#	Required-Stop			$remote_fs $syslog
#	Default-Start			2 3 4 5 
#	Default-Stop 			0 1 6
#	Short-Description		Put a short description of the service here
#	Description			Put a long description of the service here
### END INIT INFO

#Change the next three lines to suit where you install your script and what you want it called
DIR=/home/programmer/webapp/
DAEMON="$DIR/webapp.py"
DAEMON_NAME=webapp

echo $DAEMON

#add any command line options for your daemon here
DAEMON_OPTS=""

#this nsxt line determines what user the script runs as
#Root generally not recommended ,but is necessary if you are using the Raspberry Pi GPIO from Python
#will debug with root then change to programmer after working
DAEMON_USER=root

#the process id of the script when it runs is store here
PIDFILE=/var/run/$DAEMON_NAME.pid

. /lib/lsb/init-functions

do_start(){
	echo -n "Starting  $DAEMON_NAME status "
	#log_daemon_msg "Start system $DAEMON_NAME daemon"
	start-stop-daemon --start --background --pidfile $PIDFILE --make-pidfile --user $DAEMON_USER  --chuid $DAEMON_USER --startas $DAEMON -- $DAEMON_OPTS
	#log_end_msg $?
	echo "$?"
}	

do_stop(){
	#log_daemon_msg "Stopping system $DAEMON_NAME daemon"
	#the line below is commented out because it is only killing the child process, not entire process tree
	#start-stop-daemon --stop --pidfile $PIDFILE --retry 10
	PID=$(cat $PIDFILE | grep -o [0-9]*)
	kill $(pstree $PID -p -a -l | grep -o [0-9]*)
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
		#status_of_proc "$DAEMON_NAME" "DAEMON" && exit 0 || exit $?
		;;
	*)
		echo "Usage: /etc/init.d/$DAEMON_NAME {start|stop|restart|status}"
		exit 1
		;;
esac
exit 0

	
	
