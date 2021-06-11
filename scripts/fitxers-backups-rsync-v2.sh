#!/bin/bash

# sincronitzem les dades del servidor de dades amb el servidor de backups
rsync -a 10.132.0.20:/fitxers /backups/fitxers -e "ssh -i /etc/ssh/ssh_host_rsa_key" --delete

fitxer="fitxers-$(date '+%d-%m-%Y')"                                # creem el nom del fitxer amb la data actual
tar -czf /backups/fitxers/$fitxer.tar.gz /backups/fitxers/fitxers   # crearem la copia del dia

if [ ! $(date '+%u') = 1 ]                                          # si NO es dilluns...
then
    fitxer="fitxers-$(date +%d-%m-%Y -d '-7 day')"                      # agafem el nom del fitxer de la setmana pasada
    rm /backups/fitxers/$fitxer.tar.gz                                  # esborrem el fitxer de la setmana anterior
else                                                                # d'altre banda, si es dilluns
    if [ ! $(date +%d) -lt 8 ]                                          # i el dia del mes es superior a 7
    then
        fitxer="fitxers-$(date +%d-%m-%Y -d '-28 day')"                     # agafem el nom del fitxer del mes pasat
        rm /backups/fitxers/$fitxer.tar.gz                                  # i esborrem el fitxer del mes anterior
    fi
fi