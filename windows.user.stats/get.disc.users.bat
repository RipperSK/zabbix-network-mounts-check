@echo off
query user|findstr Disc|C:\admin\gawk\bin\awk.exe "{print $1}"