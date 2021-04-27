# HOW TO deploy Logged in users monitoring on Windows

* copy contents of gawk.zip archive to C:\admin\gawk
* copy all the .bat files to C:\admin\zabbix\ 
* add the following lines to C:\admin\zabbix\zabbix_agent.conf :

```
UserParameter=get.active.users,C:\admin\zabbix\get.active.users.bat
UserParameter=get.disc.users,C:\admin\zabbix\get.disc.users.bat
UserParameter=get.active.users.count,C:\admin\zabbix\get.active.users.count.bat
UserParameter=get.disc.users.count,C:\admin\zabbix\get.disc.users.count.bat
```
