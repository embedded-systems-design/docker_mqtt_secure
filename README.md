* <https://crodrigues.com/setting-up-a-secure-mosquitto-mqtt-broker-with-ssl-tls-and-user-access-control-mqtt-series-2/>
* <http://www.steves-internet-guide.com/mosquitto-tls/>
* <http://www.steves-internet-guide.com/creating-and-using-client-certificates-with-mqtt-and-mosquitto/>
* <http://www.steves-internet-guide.com/mqtt-username-password-example/>
* <https://knowledge.digicert.com/general-information/openssl-quick-reference-guide>
* <https://docs.openssl.org/3.0/man1/openssl-x509/#description>
* <https://stackoverflow.com/questions/4294689/how-to-generate-an-openssl-key-using-a-passphrase-from-the-command-line>
* <https://stackoverflow.com/questions/44047315/generate-a-self-signed-certificate-in-docker>
* <https://stackoverflow.com/questions/25292198/docker-how-can-i-copy-a-file-from-an-image-to-a-host>
* <https://stackoverflow.com/questions/25292198/docker-how-can-i-copy-a-file-from-an-image-to-a-host>

create a passphrase file
docker build -t mqtt_secure . --build-arg subjectAltName="DNS.1:$MY_NAME,DNS.2:$MY_IP,IP.1:$MY_IP"

security groups

docker build -t mqtt_secure . --build-arg subjectAltName="DNS.1:$MY_NAME,DNS.2:$MY_IP,IP.1:$MY_IP"
./get_cert.bash 
