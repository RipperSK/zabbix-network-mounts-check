#!/bin/bash
# Distribute with zabbix_agent.d file userparameter_filename_discovery.conf
# 1st mandatory argument is absolute path of destination directory
#
# Author:       Roman Spiak
# Email:        spiak.roman@gmail.com
# Mod.Date:     2020-06-04

argCount=$#

# argument count check
if [ $argCount -ne 1 ]; then
	echo ERROR: argument count missmatch
	exit 1
fi

dir=$1

fileNames=`ls $dir`
fileCount=`echo $fileNames|wc -w`

iter=0

echo '{'
echo '  "data":['
for i in $fileNames; do
	echo '  {'
	echo "     \"{#FILE}\": \"$i\""
	iter=$((iter+1))
	if [ $iter -eq $fileCount ]; then
		echo '  }'
	else
		echo '  },'
	fi
done
echo '  ]'
echo '}'
