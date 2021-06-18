#!/bin/bash
# Data de la execucio
data=$(date '+%d-%m-%Y')
fitxer="fitxers-$data"
dSetm=$(date '+%u')
rsync -a 10.132.0.20:/fitxers /backups/fitxers -e "ssh -i /etc/ssh/ssh_host_rsa_key" --delete
# Si es dilluns creem un fitxer comprimit
if [ $dSetm = 1 ]
then
    tar -cf /backups/fitxers/$fitxer.tar /backups/fitxers/fitxers
fi
