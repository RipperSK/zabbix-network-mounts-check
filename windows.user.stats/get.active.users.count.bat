@echo off
query user|findstr Active|C:\admin\gawk\bin\awk.exe "{count++} END {print count}"