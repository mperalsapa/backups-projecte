#!/bin/bash
# Data de la execucio
data=$(date '+%d-%m-%Y')
fitxer="mongo-$data"
# Creacio del backup
ssh -i /etc/ssh/ssh_host_rsa_key 10.132.0.10 "mongodump -u root -p prFeUqWL6hchFm8q --authenticationDatabase=admin -d nodebb && tar -czf $fitxer.tar.gz dump && rm -r dump"
# Copia del backup
scp -i /etc/ssh/ssh_host_rsa_key 10.132.0.10:/root/"$fitxer.tar.gz" "/backups/mongodb/$fitxer.tar.gz"
# Eliminacio del fitxer temporal en el servidor de bases de dades
ssh -i /etc/ssh/ssh_host_rsa_key 10.132.0.10 "rm $fitxer.tar.gz"
