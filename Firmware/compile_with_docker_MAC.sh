#!/bin/bash

docker buildx create --name rosetta --platform linux/amd64 --use

docker buildx build --platform linux/amd64 --load -t openlog_artemis_firmware --progress=plain --no-cache-filter deployment .

docker create --name=openlog_artemis_container openlog_artemis_firmware:latest
docker cp openlog_artemis_container:/OpenLog_Artemis.ino.bin .
docker container rm openlog_artemis_container

# Notes
#
# To run:
# 1) right click on containing folder and select "Run Terminal in Folder"
# 2) For first attempt will need to run in terminal "chmod +x compile_with_docker_MAC.sh" to allow execution
# 3) Then in terminal can command "./compile_with_docker_MAC.sh"