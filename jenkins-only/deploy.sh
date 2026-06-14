#!/bin/bash

PORT=$1
WORK_DIR=$2
SPRING_PROFILE=$3
JAR_NAME=$4

# health check application
CHECK_MAX_COUNT=10
CHECK_COUNT=0
app_health_check() {
  if [ $CHECK_COUNT -gt $CHECK_MAX_COUNT ];
  then
    echo "Failure of running java application(${PORT})"
    exit 50
  fi

  status_code=$(curl --connect-timeout 1 --max-time 3 -i -X GET http://localhost:"${PORT}"/test | awk '/HTTP\/1/{print $2}')
  if [[ $status_code =~ ^2[0-9]{2}$ ]];
  then
    echo "application(${PORT}) health check > UP"
  else
    echo "application(${PORT}) health check > DOWN"
    sleep 3
    CHECK_COUNT=$(expr ${CHECK_COUNT} + 1)
    app_health_check
  fi
}

cd ${WORK_DIR}
echo "Stopping existing application..."
pkill -f ${JAR_NAME} || true

echo "Starting new application..."
nohup java -jar \
  -Dspring.profiles.active="${SPRING_PROFILE}" \
  ${JAR_NAME} > app.log 2>&1 &

echo "Health checking..."
app_health_check

echo "Application Deployment completed!!"