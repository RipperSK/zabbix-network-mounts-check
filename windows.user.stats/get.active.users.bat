@echo off
query user|findstr Active|C:\admin\gawk\bin\awk.exe "{print $1}"