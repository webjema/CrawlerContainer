#!/usr/bin/env bash
export IMAGE_REPO_NAME="webjema/crawler1"
export IMAGE_TAG="devo"

export PARALLEL_TASKS_QNT=1
export JAR_FILE_NAME="CrawlerService-1.0-SNAPSHOT-jar-with-dependencies.jar"
export JAR_FILE_FOLDER="/usr/shared/crawler/vol"
export JAR_FILE_URL="$JAR_FILE_FOLDER/$JAR_FILE_NAME"

if [ "$1" == "build" ]; then
  echo "Build requested"
  docker build --build-arg enviroment=devo -t $IMAGE_REPO_NAME:$IMAGE_TAG .
  docker tag $IMAGE_REPO_NAME:$IMAGE_TAG $IMAGE_REPO_NAME:$IMAGE_TAG
fi

cp $(pwd)/../CrawlerService/target/$JAR_FILE_NAME $JAR_FILE_NAME

echo "Run $IMAGE_REPO_NAME:$IMAGE_TAG"
docker run --privileged=true --volume $(pwd):$JAR_FILE_FOLDER --env JAR_FILE_NAME=$JAR_FILE_NAME --env JAR_FILE_URL=$JAR_FILE_URL --env PARALLEL_TASKS_QNT=$PARALLEL_TASKS_QNT --env AWS_ACCESS_KEY_ID=$AWS_ACCESS_KEY_ID --env AWS_SECRET_KEY=$AWS_SECRET_KEY $IMAGE_REPO_NAME:$IMAGE_TAG
