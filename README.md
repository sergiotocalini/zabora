# zabora
Zabbix Agent - Oracle

# Dependencies
## Packages
* ksh

### Debian/Ubuntu

    #~ sudo apt install ksh
    #~

### Red Hat

    #~ sudo yum install ksh
    #~

# Deploy
The username and the password can't be empty.
Default variables:

NAME|VALUE
----|-----
ORACLE_USER|monitor
ORACLE_PASS|<nodefault>

*Note: this variables has to be saved in the config file (zabora.conf) in the same directory than the script.*

## Zabbix

    #~ git clone https://github.com/sergiotocalini/zabora.git
    #~ sudo ./zabora/deploy_zabbix.sh
    #~ sudo systemctl restart zabbix-agent
    
*Note: the installation has to be executed on the zabbix agent host and you have to import the template on the zabbix web. The default installation directory is /etc/zabbix/scripts/agentd/zabora*
