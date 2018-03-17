# Bygg imaget med utgangspunkt i Alpine linux (ca 4MB)
FROM alpine:latest

# Kjør følgende kommando for å installere bind og kjøremiljøet openrc
RUN apk update && apk add bind --no-cache

# Kopier våre egne filer til filsystemet i containeren Eksempler nedenfor på enkeltfiler og hele mappen
#COPY ./workdir/db.200.168.192 ./etc/bind/
#COPY ./workdir/db.testlab.local ./etc/bind/
#COPY ./workdir/named.conf ./etc/bind/
#COPY ./workdir/named.conf.include ./etc/bind/
#COPY ./workdir/root.hint ./etc/bind/
#COPY ./workdir/localhost.zone ./etc/bind/
#COPY ./workdir/127.0.0.zone ./etc/bind/
COPY ./workdir/* ./etc/bind/

# Eksponer denne porten på containeren
EXPOSE 53

## Kommando etter oppstart
CMD ["/usr/sbin/named", "-c", "/etc/bind/named.conf", "-g", "-u", "named", "-4"]