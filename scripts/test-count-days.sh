#!/bin/bash
# Desactivem el servei automatic de temps per que no ens canvii la data
timedatectl set-ntp false
###########################
dies=900 # dies sumats a la data actual
dSetm=$(date '+%u') # dia de la setmana en numero
dataActual=$(date +%Y%m%d) # data actual sobre la que treballarem

$nomFitxer="copia"


for i in $(seq 1 $dies)
do
    #echo "asignando" $(date -d "$dataActual+$i day" +%Y%m%d)
    sudo date +%Y%m%d -s "$dataActual+$i day"
    fitxer="copia_$(date +%Y-%m-%d)"
    sudo touch $fitxer
    dSetm=$(date '+%u')
    mes=$(date '+%m')
    if [ ! $dSetm = 1 ]
    then
        ultimaSetmana=$(date +%Y-%m-%d -d '-7 day')
        fitxer="copia_$ultimaSetmana"
        rm $fitxer
    else
        if [ ! $(date +%d) -lt 8 ]
        then
            fitxer="copia_$(date +%Y-%m-%d -d '-28 day')"
            rm $fitxer
        fi
    fi
done

# numero de setmana del mes
# $((($(date +%-d)-1)/7+1))
# Tornem a activar el servei automatic de temps una vegada hem acabat
timedatectl set-ntp true
