# <https://crodrigues.com/setting-up-a-secure-mosquitto-mqtt-broker-with-ssl-tls-and-user-access-control-mqtt-series-2/>
# <http://www.steves-internet-guide.com/mosquitto-tls/>
# <http://www.steves-internet-guide.com/creating-and-using-client-certificates-with-mqtt-and-mosquitto/>
# <http://www.steves-internet-guide.com/mqtt-username-password-example/>

# <https://knowledge.digicert.com/general-information/openssl-quick-reference-guide>
# <https://docs.openssl.org/3.0/man1/openssl-x509/#description>

FROM ubuntu:24.04
WORKDIR /temp
COPY ./passphrase.txt ./

RUN apt update && apt install -y mosquitto mosquitto-clients openssl nano tree

# <https://stackoverflow.com/questions/4294689/how-to-generate-an-openssl-key-using-a-passphrase-from-the-command-line>
# RUN mkdir /temp/certs
WORKDIR /certs
# RUN openssl genrsa -des3 -out ca.key -passout file:/temp/passphrase.txt 2048
# RUN openssl req -new -key ca.key -out ca.csr -sha256 -passin file:/temp/passphrase.txt -subj "/"
# RUN openssl x509 -req -in ca.csr -signkey ca.key -out ca-root.crt -days 180 -sha256 -passin file:/temp/passphrase.txt
# # <https://stackoverflow.com/questions/44047315/generate-a-self-signed-certificate-in-docker>
# # RUN openssl req -new -x509 -days 1826 -key ca.key -passin file:passphrase.txt -subj "/C=US/ST=AZ/O=ASU/CN=localhost" --out ca.crt
# # RUN openssl genrsa -out server.key 2048
# RUN openssl genrsa -out mosquitto.key 2048

# # RUN openssl req -new -out server.csr -key server.key -subj "/C=US/ST=AZ/O=ASU/CN=localhost"
# RUN openssl req -new -key mosquitto.key -out mosquitto.csr -sha256 -subj "/CN=localhost"

# # RUN openssl x509 -req -in server.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out server.crt -days 360 -passin file:passphrase.txt
# RUN openssl x509 -req -in mosquitto.csr -CA ca-root.crt -CAkey ca.key -CAcreateserial -out mosquitto.crt -days 180 -passin file:/temp/passphrase.txt

# RUN mv * /etc/mosquitto/certs/

# RUN chmod 644 /etc/mosquitto/certs/mosquitto.key

RUN apt update && apt install -y git

ENV subjectAltName='DNS.1:localhost,DNS.2:192.168.0.219,IP.1:192.168.0.219'

RUN git clone https://github.com/embedded-systems-design/external_mosquitto_ca_and_certs.git 
WORKDIR /certs/external_mosquitto_ca_and_certs 
RUN chmod +x ca_maker client_maker
RUN ./ca_maker 
RUN ./client_maker pem student

WORKDIR /temp

RUN tar -cvzf certs.tar.gz /etc/mosquitto/certs

COPY ./mosquitto.conf ./
RUN mv mosquitto.conf /etc/mosquitto/conf.d/

RUN touch mosquitto.log

EXPOSE 1883
EXPOSE 8883



