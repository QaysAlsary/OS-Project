#! /bin/bash
ip=127.0.0.1
user=YOUR USERNAME
pass=YOUR PASSWORD
#files=''
#for file in $@
#do 
#	files=$files+ $file +' '
#done
ftp -n <<EOF
open $ip
user $user $pass
get $1
EOF
