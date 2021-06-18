#!/bin/bash

timedatectl set-ntp false       # Desactivem el servei automatic de temps per que no ens canvii la data
dies=900                        # dies sumats a la data actual
dSetm=$(date '+%u')             # dia de la setmana en numero
dataActual=$(date +%Y%m%d)      # data actual sobre la que treballarem


for i in $(seq 1 $dies)
do
    sudo date +%Y%m%d -s "$dataActual+$i day"   # canviem la data del sistema per fer les proves
    fitxer="copia_$(date +%Y-%m-%d)"            # creem el nom del fitxer amb la data actual
    sudo touch $fitxer                          # crearem el fitxer, en un cas real seria un zip o el que estiguem tractant
    dSetm=$(date '+%u')                         # agafem el dia de la setmana en numero (dilluns 1, dimarts 2, etc...)
    if [ ! $dSetm = 1 ]                         # si NO es dilluns...
    then
        ultimaSetmana=$(date +%Y-%m-%d -d '-7 day')         # agafem la data d'una setmana enrere
        fitxer="copia_$ultimaSetmana"                       # "aconseguim" el nom del fitxer
        rm $fitxer                                          # esborrem el fitxer de la setmana anterior
    else                                        # d'altre banda, si es dilluns
        if [ ! $(date +%d) -lt 8 ]                          # i el dia del mes es superior a 7
        then
            fitxer="copia_$(date +%Y-%m-%d -d '-28 day')"           # agafem el nom del fitxer del mes pasat
            rm $fitxer                                              # i esborrem el fitxer del mes anterior
        fi
    fi
done

## d'aquesta manera tenim copias mensuals, setmanals temporalment i diaries

# Tornem a activar el servei automatic de temps una vegada hem acabat
timedatectl set-ntp true
