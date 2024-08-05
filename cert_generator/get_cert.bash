#!/usr/bin/bash

# <https://stackoverflow.com/questions/25292198/docker-how-can-i-copy-a-file-from-an-image-to-a-host>
#docker run --rm --entrypoint cat mqtt_secure /etc/mosquitto/certs/ca.crt > ca.crt
# docker exec  dazzling_chatterjee cat /etc/mosquitto/certs/ca.crt > ca.crt
#docker compose run --rm mqtt cat /etc/mosquitto/certs/ca.crt > ca.crt
docker exec mqtt cat /temp/certs.tar.gz > certs.tar.gz
