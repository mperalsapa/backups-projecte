#!/bin/bash
# Data de la execucio
data=$(date '+%d-%m-%Y')
fitxer="mysql-$data"
# Creacio del backup
ssh -i /etc/ssh/ssh_host_rsa_key 10.132.0.10 "mysqldump -u root --all-databases > $fitxer.sql"
# Copia del backup
scp -i /etc/ssh/ssh_host_rsa_key 10.132.0.10:/root/"$fitxer.sql" "/backups/mysql/$fitxer.sql"
# Eliminacio del fitxer temporal en el servidor de bases de dades
ssh -i /etc/ssh/ssh_host_rsa_key 10.132.0.10 "rm $fitxer.sql"