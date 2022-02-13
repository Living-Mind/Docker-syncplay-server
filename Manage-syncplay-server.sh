#!/bin/sh

# Start docker service
systemctl start docker
sleep 5

# Start Syncplay Container
docker start Syncplay
sleep 5

# Execute syncplay-server commands in background
docker container exec Syncplay syncplay-server --port 8088 --max-chat-message-length 300 --password somePassword --salt XATUBFPRCO &
sleep 5

echo "Server should be ready."


echo "To stop the server type 1"

read stopServer

if [ $stopServer -eq 1 ]; then
	
# Stop Syncplay Container
	docker stop Syncplay
sleep 5

# Stop docker service
systemctl stop docker.socket
sleep 5
 
echo "done"

else
	echo "Not an option."
fi
