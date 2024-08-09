FROM ubuntu:24.04
WORKDIR /temp
COPY ./passphrase.txt ./

RUN apt update && apt install -y mosquitto mosquitto-clients openssl nano tree

WORKDIR /certs

RUN apt update && apt install -y git

RUN echo "my ip: $MY_IP" && echo "my name: $MY_NAME"
ENV subjectAltName='DNS.1:$MY_NAME,DNS.2:$MY_IP,IP.1:$MY_IP'

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