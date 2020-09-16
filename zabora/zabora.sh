#!/usr/bin/env ksh
rcode=0
PATH=/usr/local/bin:${PATH}

#################################################################################

#################################################################################
#
#  Variable Definition
# ---------------------
#
APP_NAME=$(basename $0)
APP_DIR=$(dirname $0)
APP_VER="1.5.4"
APP_WEB="https://sergiotocalini.github.io"
#
#################################################################################

#################################################################################
#
#  Load Oracle Environment
# -------------------------
#
[ -r ${APP_DIR}/${APP_NAME%.*}.conf ] && . ${APP_DIR}/${APP_NAME%.*}.conf
#
#################################################################################

#################################################################################
#
#  Function Definition
# ---------------------
#
usage() {
    echo "Usage: ${APP_NAME%.*} [Options]"
    echo ""
    echo "Options:"
    echo "  -h            Displays this help message."
    echo "  -a            Query arguments."
    echo "  -s ARG(str)   Query to Oracle."
    echo "  -o ARG(str)   Set SID to make the query."
    echo "  -j            Jsonify output."
    echo "  -v            Show the script version."
    echo ""
    echo "Please send any bug reports to https://github.com/sergiotocalini/zabora/issues"
    exit 1
}

version() {
    echo "${APP_NAME%.*} ${APP_VER}"
    exit 1
}

zabbix_not_support() {
    echo "ZBX_NOTSUPPORTED"
    exit 1
}
#
#################################################################################

#################################################################################
while getopts ":a:j:o:s:Hv" OPTION; do
    case ${OPTION} in
	H)
	    usage
	    ;;
	a)
	    SQL_ARGS=${OPTARG}
	    ;;
        j)
            JSON=1
	    JSON_ATTR=${OPTARG}
            ;;
	o)
	    ORACLE_SID=${OPTARG}
	    ;;
	s)
	    SQL="${APP_DIR}/sql/${OPTARG}"
	    ;;
	v)
	    version
	    ;;
         \?)
            exit 1
            ;;
    esac
done

if [[ -f ${APP_DIR}/zabora.oraenv ]]; then
    . ${APP_DIR}/zabora.oraenv
else
    ORAENV_ASK=NO
    . /usr/local/bin/oraenv > /dev/null
fi
if [[ -f "${SQL%.sql}.sql" ]]; then
    rval=`sqlplus -s ${ORACLE_USER}/${ORACLE_PASS} @${SQL} "${SQL_ARGS}"`
    rcode="${?}"
    if [[ ${JSON} -eq 1 ]]; then
       set -A rval ${rval}
       echo '{'
       echo '   "data":['
       count=1
       for i in ${rval[@]};do
          output='{ "'{#${JSON_ATTR}}'":"'${i}'" }'
          if (( ${count} < ${#rval[*]} )); then
             output="${output},"
          fi
          echo "      ${output}"
          let "count=count+1"
       done
       echo '   ]'
       echo '}'
    else
       echo ${rval:-0}
    fi
else
    zabbix_not_support
fi

exit ${rcode}
