#!/bin/sh
sleep 5
#echo "Starting Docker Daemon"
#dockerd &
echo "Downloading JAR from $JAR_FILE_URL"
cp $JAR_FILE_URL $JAR_FILE_NAME

echo "AWS_ACCESS_KEY_ID = $AWS_ACCESS_KEY_ID";
echo "AWS_SECRET_KEY = $AWS_SECRET_KEY";

#echo "Starting Docker Compose"
#docker-compose up -d --scale chrome=$PARALLEL_TASKS_QNT
echo "Starting CrawlerService"
java -jar CrawlerService-1.0-SNAPSHOT-jar-with-dependencies.jar CrawlerTasks