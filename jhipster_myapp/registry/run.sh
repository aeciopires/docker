#!/bin/bash
# Iniciando o Registry no Ubuntu

SERVICE_PROFILE=$1
SERVICE_PROFILE=${SERVICE_PROFILE:-prod}
SERVICE_DIR_BASE=/home/jhipster/
SERVICE_DIR=$SERVICE_DIR_BASE//registry
SERVICE_APP_FILE=registry-service.war
LOGFILE=$SERVICE_DIR_BASE/log/registry.log
ADMIN_USER=jhipster
CONFIG_PROFILE=$SERVICE_PROFILE

cd $SERVICE_DIR/
/bin/su -c "/usr/bin/java -jar $SERVICE_DIR/$SERVICE_APP_FILE --logging.file=$LOGFILE --spring.profiles.active=$CONFIG_PROFILE " $ADMIN_USER
