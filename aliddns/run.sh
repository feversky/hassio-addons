#!/bin/bash
set -e

CONFIG_PATH=/data/options.json

ID=$(jq --raw-output ".accesskey_id" $CONFIG_PATH)
SECRET=$(jq --raw-output ".accesskey_secret" $CONFIG_PATH)
DOMAINS=$(jq --raw-output ".domain | length" $CONFIG_PATH)
REDO=$(jq --raw-output ".redo" $CONFIG_PATH)

while true
do
    set +e
    CURRENT_IP=$(aliyun-ddns-cli getip | grep -E -o '([0-9]+\.){3}[0-9]+')
    if [ $? -eq 0 ]; then
        echo current ip is $CURRENT_IP, updating ...
        
        if [ "$DOMAINS" -gt "0" ]; then
            for (( i=0; i < "$DOMAINS"; i++ )); do
                DOMAIN=$(jq --raw-output ".domain[$i]" $CONFIG_PATH)
                aliyun-ddns-cli --id ${ID} --secret ${SECRET} update -d ${DOMAIN} -i ${CURRENT_IP}
            done
        fi
        sleep ${REDO}
    else        
        sleep 5
    fi
    set -e
done