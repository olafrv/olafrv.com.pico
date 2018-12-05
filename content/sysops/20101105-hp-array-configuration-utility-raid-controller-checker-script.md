---
title: HP Array Configuration Utility RAID Controller Checker Script
created: 2010/11/05 15:16:11
---

## Install the HP Managment Component Pack for Proliant

The bellow **hpacucli-check.sh** is a bash shell script that checks the status of controller, array, logical and physical driver on a HP Server with the command hpaculi (HP Array Configuration Utility Client) installed, also syslogging and sending an email with errors, warning and alerts to administrators. From 2012 the HP Array Configuration Utility is part of the HP Managment Component Pack for Proliant (MCP) instead of the HP Support Pack for Proliant (SPP), the former provides agent software for use on community-supported distributions, while the last one, provides support for RedHat and SUSE distributions. Also the MCP (unlike the SPP, HP Support Pack for Proliant) does not provide drivers and firmware (firmware is provided via HPSUM, and drivers are provided by the distribution vendors). You can review the MCP product home page for more information, including support matrices and iso image downloads. The **OLD** HP SPP CD for Debian GNU/Linux 5.0 ("lenny") and Ubuntu 9.04 ("jaunty") x86 and AMD64/EM64T" was downloadable from the HP Support Web Site (at least in December, 2012): [https://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc;=US&swItem;=MTX-799829d8271f455d9367978b5a&prodTypeId;=15351&prodSeriesId;=1121516](https://h20000.www2.hp.com/bizsupport/TechSupport/SoftwareDescription.jsp?lang=en&cc=US&swItem=MTX-799829d8271f455d9367978b5a&prodTypeId=15351&prodSeriesId=1121516) The **NEW** HP MCP from [Hewlett-Packard (HP) Software Delivery Repository]( https://downloads.linux.hp.com/SDR/) or directly here <https://downloads.linux.hp.com/SDR/project/mcp/> The HP MCP includes: 

  * hp-health: HP System Health Application and Command line Utilities
  * hponcfg: HP RILOE II/iLO online configuration utility
  * hp-snmp-agents: Insight Management SNMP Agents for HP ProLiant Systems
  * hpsmh: HP System Management Homepage
  * hp-smh-templates: HP System Management Homepage Templates
  * hpacucli: HP Command Line Array Configuration Utility
  * cpqacuxe: HP Array Configuration Utility
  * hp-ams: HP Agentless Management Service

## HP ACU CLI Checker Script

This is an improved version from the previus script, test for 6 months in HP Proliant G4, G5, G6 and G7 Servers with GNU/Linux Debian 6/7, who where migrated from use HP SPP to HP MCP, for more information about this procedure in Debian look at: <https://wiki.debian.org/HP/ProLiant >

```bash
    #!/bin/bash
    
    ###
    # FILE:    hpacucli-check.sh (03-Dec-2013)
    # LICENSE: GNU/GPL v3.0
    # AUTHOR:  Olaf Reitmaier Veracierta  
    # USAGE:   Check the status of the logical drives on a HP Server 
    #          with hpacucli (HP Array Configuration Utility Client)
    #          installed, syslog and send an email with errors.
    ##
    
    HPACUCLI=/usr/sbin/hpacucli
    HPACUCLI_TMP=/tmp/hpacucli.log
    
    # Debugging?, just pass debug as first parameter.
    if [ -z "$1" ]
    then
    	DEBUG=0
    elif [ "$1" == "debug" ]
    then
    	DEBUG=1
    fi
    
    ###
    # SUPPORT COMMUNICATION - CUSTOMER ADVISORY - Document ID: c03676138 - Version: 1
    # https://h20566.www2.hp.com/portal/site/hpsc/template.PAGE/public/kb/docDisplay/?sp4ts.oid=3924066&spf;_p.tpst=kbDocDisplay&spf;_p.prp_kbDocDisplay=wsrp-navigationalState%3DdocId%253Demr_na-c03676138-1%257CdocLocale%253D%257CcalledBy%253D&javax.portlet.begCacheTok;=com.vignette.cachetoken&javax.portlet.endCacheTok;=com.vignette.cachetoken
    # ADVISORY: Linux - HP Array Configuration Utility CLI for Linux (Hpacucli) Version 9.00 (Or Later) Is Delayed in Responding if Storage That Is Not Connected to Local Smart Array Controller Is Configured With Multiple LUNs
    # DESCRIPTION: There may be a delay starting the HP Array Configuration Utility CLI for Linux (hpacucli) Version 9.00 (or later) on an HP ProLiant server configured to detect multiple LUNs connected via Fibre or iSCSI storage. In addition, there may be times that certain commands will delay in operating. This occurs because functionality was added to the ACU to discover HP branded Solid State Drives (SSD) that are not connected to the HP Smart Array controllers. 
    # SCOPE: Any HP ProLiant server running the HP Array Configuration Utility CLI for Linux (hpacucli) Version 9.00 (or later) configured to detect multiple LUNs connected via Fibre or iSCSI storage. As a workaround, to prevent the delay from occurring when accessing local storage, type the following command: 
    # export INFOMGR_BYPASS_NONSA=1
    # To re-enable the feature non-smart array device scanning, type the following command.
    # export -n INFOMGR_BYPASS_NONSA
    export INFOMGR_BYPASS_NONSA=1
    ##
    
    # Clean temp files
    function deleteTmpFiles
    {
    	rm -f $FILE_DISK
    	rm -f $FILE_DRIVE
    	rm -f $FILE_ARRAY
    	rm -f $FILE_ARRAY_STATUS
    	rm -f $FILE_SLOT
    	rm -f $FILE_SLOT_STATUS
    }
    
    # Logging 
    function doLog
    {
    	# doLog "$slot" "$msg" "level" $DEBUG
    	slot=$1
    	msg=$2
    	level=$3
    	debug=$4
    	if [ "$level" == "error" ] || [ "$level" == "alert" ] || [ "$debug" == "1" ]
    	then
    		echo $msg
    	fi
    	logger -p syslog.$level -t hpacucli "$msg"
    	if [ "$level" == "error" ] || [ "$level" == "alert" ]
    	then
    	  $HPACUCLI ctrl slot=$slot show config detail
    	fi
    }
    
    if ps -edf | grep hpacucli | egrep -v "grep|puppet" > /dev/null
    then
      msg="[ERROR] hpacucli is already running, so will not run again"
    	echo $msg
      logger -p syslog.info -t $HPACUCLI_TAG "$msg"
    	deleteTmpFiles
    	exit 1
    fi
    
    FILE_DATE=$(date "+%Y-%m-%d-%I_%M")
    FILE_SLOT=/tmp/hpacucli_${FILE_DATE}_slot.txt
    FILE_SLOT_STATUS=/tmp/hpacucli_${FILE_DATE}_slot_status.txt
    FILE_ARRAY=/tmp/hpacucli_${FILE_DATE}_array.txt
    FILE_ARRAY_STATUS=/tmp/hpacucli_${FILE_DATE}_array_status.txt
    FILE_DRIVE=/tmp/hpacucli_${FILE_DATE}_drive.txt
    FILE_DISK=/tmp/hpacucli_${FILE_DATE}_disk.txt
    
    # Controllers (Slots) Status
    ERROR_NOSLOT=1
    $HPACUCLI ctrl all show | grep "Slot " > $FILE_SLOT
    while read line1
    do
      ERROR_NOSLOT=0
      slot=`expr match "$line1" '.*Slot \([0-9]\).*'`
    
    	# Controller (Slot) Status
    	$HPACUCLI ctrl slot=$slot show status | grep "Status" | grep -v "Not Configured" > $FILE_SLOT_STATUS
    	while read line2		
    	do
    		if echo "$line2" | grep "OK" > /dev/null
    		then
    			msg="[OK] RAID controller slot $slot -> $line2"
    			doLog "$slot" "$msg" "info" $DEBUG
    		else
    			msg="[ERROR] RAID controller slot $slot -> $line2"
    			doLog "$slot" "$msg" "error" $DEBUG
    		fi
    	done < $FILE_SLOT_STATUS
    
    	# Arrays Status
      $HPACUCLI ctrl slot=$slot array all show | grep array > $FILE_ARRAY
      while read line2
      do
    		array=`expr match "$line2" '.*array \([a-Z]\).*'`
    
    		# Array Status
    		ERROR_NOARRAY=1
    		$HPACUCLI ctrl slot=$slot array $array show status | grep array > $FILE_ARRAY_STATUS
    		while read line3		
    		do
        	ERROR_NOARRAY=0
    			if echo "$line3" | grep "OK" > /dev/null
    			then
    			 	msg="[OK] RAID controller slot $slot array $array -> $line3"
    				doLog "$slot" "$msg" "info" $DEBUG
    			else
    				msg="[ERROR] RAID controller slot $slot array $array -> $line3"
    				doLog "$slot" "$msg" "error" $DEBUG
    			fi
    		done < $FILE_ARRAY_STATUS
    		if [ $ERROR_NOARRAY -eq 1 ]
    		then
    			msg="[WARN] No array error on RAID controller slot #$slot"
    			doLog "$slot" "$msg" "warning" $DEBUG
    		fi
    		
    		# Physical Drive (Disk) Status
    		ERROR_NODISK=1
     	  $HPACUCLI ctrl slot=$slot physicaldrive all show | grep physicaldrive > $FILE_DISK
        while read line4
     	  do
    			ERROR_NODISK=0
          physicaldrive=`expr match "$line4" '.*physicaldrive \(.*\:.*\:.*\) ('`
       	  if [ `$HPACUCLI ctrl slot=$slot physicaldrive $physicaldrive show | grep "Status: OK" | wc -l` -eq 0 ]
     	    then
            msg="[ERROR] RAID controller slot #$slot physicaldrive $physicaldrive -> $line4"
    				doLog "$slot" "$msg" "error" $DEBUG
     	    else
            msg="[OK] RAID controller slot #$slot physicaldrive $physicaldrive -> $line4"
    				doLog "$slot" "$msg" "info" $DEBUG
     	    fi
        done < $FILE_DISK
    
    		if [ $ERROR_NODISK -eq 1 ]
    		then
    			msg="[WARN

```

## Comments

**[Damon Smith](#3801 "2011-04-02 03:53:17"):** Just setup a DL180 with a P410 as a homebuilt SAN and this script proved priceless! Thanks a lot!

**[Philippe Lang](#5568 "2012-12-21 08:49:41"):** Hi, works fine, except that I had to change your script slightly in order to make it work correctly: Instead of `if [ `hpacucli ctrl slot=$slot array $array logicaldrive $logicaldrive show | grep "Status: OK$" | wc -l` -lt 2 ]` I use: `if [ `hpacucli ctrl slot=$slot array $array logicaldrive $logicaldrive show | grep "Status: OK$" | wc -l` -lt 1 ]` I'm not sure why you expect "Status: OK" twice on your setup.

**[Pedro](#8771 "2014-06-04 05:40:53"):** It's great, but the e-mail function ?

**[olafrv](#9398 "2014-09-14 18:36:09"):** You must run the script from a cronjob and set the MAIL global var, because the script is designed to output messages on debugging mode or when it detects errors.