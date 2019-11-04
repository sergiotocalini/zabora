# zabora
Zabbix Agent - Oracle

# Dependencies
## Packages
* ksh

### Debian/Ubuntu

```
~# sudo apt install ksh
~#
```

### Red Hat

```
#~ sudo yum install ksh
~#
```

## User account
We will need an account to perform all the checks. Below are the sentences to do it.

```plsql
CREATE USER monitor IDENTIFIED BY 'xxxxxxx' DEFAULT TABLESPACE SYSTEM TEMPORARY TABLESPACE TEMP PROFILE DEFAULT ACCOUNT UNLOCK;
GRANT CONNECT TO monitor;
GRANT RESOURCE TO monitor;
ALTER USER monitor DEFAULT ROLE ALL;
GRANT SELECT ANY TABLE TO monitor;
GRANT CREATE SESSION TO monitor;
GRANT SELECT ANY DICTIONARY TO monitor;
GRANT UNLIMITED TABLESPACE TO monitor;
GRANT SELECT ANY DICTIONARY TO monitor;
GRANT SELECT ON V_$SESSION TO monitor;
GRANT SELECT ON V_$SYSTEM_EVENT TO monitor;
GRANT SELECT ON V_$EVENT_NAME TO monitor;
GRANT SELECT ON V_$RECOVERY_FILE_DEST TO monitor;
```

# Deploy
The username and the password can't be empty.
Default variables:

NAME|VALUE
----|-----
ORACLE_USER|monitor
ORACLE_PASS|xxxxxxx
ORACLE_OSID|oracle

*__Note:__ these variables have to be saved in the config file (zabora.conf) in
the same directory than the script.*

## Zabbix

```bash
~# git clone https://github.com/sergiotocalini/zabora.git
~# ./zabora/deploy_zabbix.sh -H
Usage:  [Options]

Options:
  -F            Force configuration overwrite.
  -H            Displays this help message.
  -P            Installation prefix (SCRIPT_DIR).
  -Z            Zabbix agent include files directory (ZABBIX_INC).
  -u            Configuration key ORACLE_USER.
  -p            Configuration key ORACLE_PASS.
  -o            Configuration key ORACLE_OSID.

Please send any bug reports to sergiotocalini@gmail.com (https://github.com/sergiotocalini)
~# ORACLE_USER="monitor"
~# ORACLE_PASS="xxxxxxx"
~# ORACLE_OSID="oracle"
~# sudo ./zabora/deploy_zabbix.sh -u "${ORACLE_USER}" -p "${ORACLE_PASS}" -o "${ORACLE_OSID}"
~# sudo systemctl restart zabbix-agent
```

*__Note:__ the installation has to be executed on the zabbix agent host and you have
to import the template on the zabbix web. The default installation directory is
/etc/zabbix/scripts/agentd/zabora*
