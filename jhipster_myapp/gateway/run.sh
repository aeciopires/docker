#!/bin/bash
# Iniciando o Jhipster Gateway no Ubuntu

SERVICE_PROFILE=$1
SERVICE_PROFILE=${SERVICE_PROFILE:-prod}
SERVICE_DIR_BASE=/home/jhipster/
SERVICE_DIR=$SERVICE_DIR_BASE/gateway
SERVICE_APP_FILE=jhipster-gateway.war
LOGFILE=$SERVICE_DIR_BASE/log/gateway.log
ADMIN_USER=jhipster
CONFIG_PROFILE=$SERVICE_PROFILE,swagger

#Necessario esperar 2 min para dar tempo subir o conteiner do Registry e MySQL antes do Gateway
sleep 120

cd $SERVICE_DIR/
/bin/su -c "/usr/bin/java -jar $SERVICE_DIR/$SERVICE_APP_FILE --logging.file=$LOGFILE --spring.profiles.active=$CONFIG_PROFILE " $ADMIN_USER
