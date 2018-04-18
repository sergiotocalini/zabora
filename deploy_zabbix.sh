#!/usr/bin/env ksh
SOURCE_DIR=$(dirname $0)
ZABBIX_DIR=/etc/zabbix

ORACLE_USER=${1:-monitor}
ORACLE_PASS=${2:-xxxxxxx}

mkdir -p ${ZABBIX_DIR}/scripts/agentd/zabora
cp -rpv  ${SOURCE_DIR}/zabora/sql                 ${ZABBIX_DIR}/scripts/agentd/zabora/
cp -rpv  ${SOURCE_DIR}/zabora/zabora.conf.example ${ZABBIX_DIR}/scripts/agentd/zabora/zabora.conf
cp -rpv  ${SOURCE_DIR}/zabora/zabora.sh           ${ZABBIX_DIR}/scripts/agentd/zabora/
cp -rpv  ${SOURCE_DIR}/zabora/zabbix_agentd.conf  ${ZABBIX_DIR}/zabbix_agentd.d/zabora.conf

regex_array[0]="s|ORACLE_USER=.*|ORACLE_USER=\"${ORACLE_USER}\"|g"
regex_array[1]="s|ORACLE_PASS=.*|ORACLE_PASS=\"${ORACLE_PASS}\"|g"
for index in ${!regex_array[*]}; do
    sed -i "${regex_array[${index}]}" ${ZABBIX_DIR}/scripts/agentd/zabora/zabora.conf
done
