@echo off
query user|findstr Disc|C:\admin\gawk\bin\awk.exe "{count++} END {print count}"