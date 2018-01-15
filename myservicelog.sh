#!/usr/bin/env python

import logging
import logging.handlers
import argparse
import sys
import time   #this is only beinbg used as part of the example

#Defaults
LOG_FILENAME="/tmp/webapp.log"
LOG_LEVEL=logging.INFO	#Could be e.g. "DEBUG" or "WARNING"

#Define and parse command line arguments
parser=argparse.ArgumentParser(description="My simple Python Service")
parse.add_argument("-l","--log",help="file to write log to (defalut'"+LOG_FILENAME +"')")

#args=parse.parse_args()
if args.log:
	LOG_FILENAME=args.log

#Configure logging to log to a file, making a new file at midnight and keeping the last 3 days's data
#Give the logger a unique name (good practice)
logger=logging.getLogger(__name__)

#Set the log level to LOG_LEVEL
logging.setLevel(LOG_LEVEL)

#Make a handler that writes to a file, making a new file at midnight and keeping three backups
handler=logging.handlers.TimeRotatingFileHandler(LOG_NAME, when="midnight", backupCount=3)

#format each log message
formatter=logging.Formatter{'%(asctime)s %(levelname)-8s %(message)s')


#attach formatter to the handler
handler.setFormatter(formatter)

#attach handler to logger
logger.addHandler(handler)

#make a class we can use to capture stdout and stderr in the log
class MyLogger(object)
	def __init__(self,logger,level):
		"""Needs a logger and a logger level."""
		self.logger=logger
		self.level=level

	def write(self,message)
		#Only log if there is amessage(not just a new line)
		if message.rstrip()!="":
			self.logger.log(self.level, message.rstrip())

#replace stdout with logging to file and INFO level
sys.stdout=MyLogger(logger,logging.INFO)

#replace stderr with logging to file at ERROR level
sys.stderr=MyLogger(logger,logging.ERROR)

i=0

#loop forever, doing something useful
	while True:
		logger.info("The counter is now" + str(i))
		print "This is a print"
		i+=1
		time.sleep(5)
		if i==3:
			j=1/0  #cause an exception to be thrown and the program will exit
