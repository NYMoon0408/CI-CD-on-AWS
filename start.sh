#!/bin/bash

REPOSITORY={jar파일이 생성된 경로}
#ex) REPOSITORY=/home/ec2-user/jenkins-home
echo "REPOSITORY = $REPOSITORY"
cd $REPOSITORY

PROJECT_NAME={프로젝트 명}
#ex) PROJECT_NAME=react-back
echo "PROJECT_NAME = $PROJECT_NAME"

PROJECT_PID=$(pgrep -f $PROJECT_NAME)
echo "PROJECT_PID = $PROJECT_PID"

if [ -z $PROJECT_PID ]; then
    echo "no running project"
else
    kill -9 $PROJECT_PID
    sleep 3
fi

JAR_NAME=$(ls $REPOSITORY/ | grep $PROJECT_NAME | tail -n 1)
echo "JAR_NAME = $JAR_NAME"

java -jar $REPOSITORY/$JAR_NAME &
