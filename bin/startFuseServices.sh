#!/bin/bash

echo "Info: Starting Docker.."

docker login

if [ $? -ne 0 ]; then

	echo "Error: Docker login failed."
	exit 0
else
	nohup docker-compose up & echo $! > fuse.pid
fi

echo "Info: Invoking Ping Service."

curl http://localhost:48080/api/v1/ping
echo $?
curl http://localhost:48081/api/v1/ping
echo $?
curl http://localhost:48082/api/v1/ping
echo $?

echo "Info: Startup completed"
