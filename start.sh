#!/bin/sh

APP_HOME=/d/projects/spring-boot-admin/target

params=(

PORT=8888

LOGGING_FILE=/d/projects/spring-boot-admin/target/logs/spring-boot-admin.log

PROFILE=prod

MAIL_HOST=smtp.lvmama.com

MAIL_USER=lijingwei@lvmama.com

MAIL_PASSWORD=

MAIL_FROM=lijingwei@lvmama.com

MAIL_TO=lijingwei@lvmama.com

SECURITY_USER=admin

SECURITY_PASSWORD=admin

)

for p in "${params[*]}"; do

app_params="${app_params} --${p}"

echo $app_params

done

#echo $app_params
LOGGING_FILE=/d/projects/spring-boot-admin/target/logs/spring-boot-admin.log
echo ${LOGGING_FILE#*/}

