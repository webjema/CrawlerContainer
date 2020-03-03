#!/bin/sh
echo "Starting Docker Daemon"
dockerd &
echo "Downloading JAR"
wget --no-check-certificate $JAR_FILE_URL
echo "Starting Docker Compose"
docker-compose up -d --scale chrome=3
echo "Starting CrawlerService"
java -jar CrawlerService-1.0-SNAPSHOT-jar-with-dependencies.jar CrawlerTasks