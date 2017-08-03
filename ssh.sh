#!/usr/bin/expect -f
set SERVER "0"
set CHOICE "0"

#-------------------#
# SET PASSWORD HERE #
#-------------------#
set SERVER_1_PKEY "passwort1"
set SERVER_2_PKEY "passwort2"
set SERVER_3_PKEY "passwort3"
set SERVER_4_PKEY "passwort4"

#-------------------#
# SET HOSTNAME HERE #
#-------------------#
set SERVER_1_HOST "yourserver1.com"
set SERVER_2_HOST "yourserver2.com"
set SERVER_3_HOST "yourserver3.com"
set SERVER_4_HOST "yourserver4.com"

#-------------------#
# SET USERNAME HERE #
# OR BLANK FOR NONE #
#-------------------#
set SERVER_1_USER "user1"
set SERVER_2_USER "user2"
set SERVER_3_USER "user3"
set SERVER_4_USER "user4"

#-------------------#
# SET THE PORT HERE #
# OR BLANK FOR '22' #
#-------------------#
set SERVER_1_PORT "22"
set SERVER_2_PORT "22"
set SERVER_3_PORT "22"
set SERVER_4_PORT "22"

#-------------------#
#--- END CONFIGS ---#
#-------------------#

proc s1 {SERVER_1_PKEY SERVER_1_HOST SERVER_1_USER SERVER_1_PORT} {
	global spawn_out
	if   {$SERVER_1_PORT eq ""} {set $SERVER_1_PORT "22"}
	if   {$SERVER_1_HOST eq ""} {puts "Invalid hostname."}
	trap {
		set XZ [stty rows   ]
		set YZ [stty columns]
		stty rows $XZ columns $YZ < $spawn_out(slave,name)
	} WINCH
	send_user "\033c"
	spawn ssh ${SERVER_1_USER}@${SERVER_1_HOST} -p ${SERVER_1_PORT}
	#[p|P]
	expect "assword:"
	send "${SERVER_1_PKEY}\r"
	interact
}

proc s2 {} {
	global spawn_out
	if   {$SERVER_2_PORT eq ""} {set $SERVER_2_PORT "22"}
	if   {$SERVER_2_HOST eq ""} {puts "Invalid hostname."}
	trap {
		set XZ [stty rows   ]
		set YZ [stty columns]
		stty rows $XZ columns $YZ < $spawn_out(slave,name)
	} WINCH
	send_user "\033c"
	spawn ssh ${SERVER_2_USER}@${SERVER_2_HOST} -p ${SERVER_2_PORT}
	#[p|P]
	expect "assword:"
	send "${SERVER_2_PKEY}\r"
	interact
}

proc s3 {} {
	global spawn_out
	if   {$SERVER_3_PORT eq ""} {set $SERVER_3_PORT "22"}
	if   {$SERVER_3_HOST eq ""} {puts "Invalid hostname."}
	trap {
		set XZ [stty rows   ]
		set YZ [stty columns]
		stty rows $XZ columns $YZ < $spawn_out(slave,name)
	} WINCH
	send_user "\033c"
	spawn ssh ${SERVER_3_USER}@${SERVER_3_HOST} -p ${SERVER_3_PORT}
	#[p|P]
	expect "assword:"
	send "${SERVER_3_PKEY}\r"
	interact
}

proc s4 {} {
	global spawn_out
	if   {$SERVER_4_PORT eq ""} {set $SERVER_4_PORT "22"}
	if   {$SERVER_4_HOST eq ""} {puts "Invalid hostname."}
	trap {
		set XZ [stty rows   ]
		set YZ [stty columns]
		stty rows $XZ columns $YZ < $spawn_out(slave,name)
	} WINCH
	send_user "\033c"
	spawn ssh ${SERVER_4_USER}@${SERVER_4_HOST} -p ${SERVER_4_PORT}
	#[p|P]
	expect "assword:"
	send "${SERVER_4_PKEY}\r"
	interact
}

set arg [lindex $argv 0]
switch $arg {
	""  { set CHOICE "0" }
	"1" { set CHOICE "1" }
	"2" { set CHOICE "2" }
	"3" { set CHOICE "3" }
	"4" { set CHOICE "4" }
}

if {$CHOICE eq "0"} {
	puts "\n ############################\n #--------------------------#"
	puts " #- SSH STARTER BY NULLDEV -#\n #--------------------------#\n ############################\n"
	puts " Please Choose server:\n\n 1 - $SERVER_1_HOST \n 2 - $SERVER_2_HOST \n 3 - $SERVER_3_HOST \n 4 - $SERVER_4_HOST \n"
	puts -nonewline " Input \[1,2,3,4\]: "
	flush stdout
	gets stdin SERVER
	if {$SERVER eq "1"} { s1 $SERVER_1_PKEY $SERVER_1_HOST $SERVER_1_USER $SERVER_1_PORT }
	if {$SERVER eq "2"} { s2 $SERVER_2_PKEY $SERVER_2_HOST $SERVER_2_USER $SERVER_2_PORT }
	if {$SERVER eq "3"} { s3 $SERVER_3_PKEY $SERVER_3_HOST $SERVER_3_USER $SERVER_3_PORT }
	if {$SERVER eq "4"} { s4 $SERVER_4_PKEY $SERVER_4_HOST $SERVER_4_USER $SERVER_4_PORT }
}

if {$CHOICE eq "1"} { s1 $SERVER_1_PKEY $SERVER_1_HOST $SERVER_1_USER $SERVER_1_PORT }
if {$CHOICE eq "2"} { s2 $SERVER_2_PKEY $SERVER_2_HOST $SERVER_2_USER $SERVER_2_PORT }
if {$CHOICE eq "3"} { s3 $SERVER_3_PKEY $SERVER_3_HOST $SERVER_3_USER $SERVER_3_PORT }
if {$CHOICE eq "4"} { s4 $SERVER_4_PKEY $SERVER_4_HOST $SERVER_4_USER $SERVER_4_PORT }

