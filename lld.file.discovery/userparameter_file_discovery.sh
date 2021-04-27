#!/bin/bash
# Distribute with zabbix_agent.d file userparameter_file_discovery.conf
# 1st mandatory argument is absolute path of destination directory
# 2nd optional argument is maxdepth number for find
# 3rd optional argument is filemask for grep
#
# TODO: adjust for files with white space chars
#
# Author:       Roman Spiak
# Email:        spiak.roman@gmail.com
# Mod.Date:     2020-06-04

argCount=$#

# argument count check
if [ $argCount -lt 1 ] || [ $argCount -gt 3 ]; then
	echo ERROR: argument count missmatch
	exit 1
fi

dir=$1
if [ $argCount -eq 1 ]; then
	maxDepth=1
	fileMask="."
elif [ $argCount -eq 2 ]; then
	maxDepth=$2
	fileMask="."
else
	maxDepth=$2
	fileMask=$3
fi

filePaths=`find $dir -maxdepth $maxDepth -type f|grep $fileMask`
fileCount=`echo $filePaths|wc -w`

iter=0

echo '{'
echo '  "data":['
for i in $filePaths; do
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
