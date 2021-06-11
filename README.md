# Scripts del projecte
Scripts utilitzats per copies de seguretat en el projecte de ASIX.
## Copies MySQL
Aquest script realitza una copia de seguretat logica (mysqldump) i la envia al servidor de backup a traves de SSH i SCP.

[mysql-soft-backup.sh](mysql-soft-backup.sh)

I aquest seria el resultat de la execucio

```
root@instancia-backups:~/scripts# ./mysql-soft-backup.sh
mysql-06-06-2021.sql       100% 1627KB  31.4MB/s   00:00
root@instancia-backups:~/scripts#
```

## Copies MongoDB
Aquest script realitza una copia de seguretat logica (mongodump) i la envia al servidor de backup a traves de SSH i SCP.

[mongo-soft-backup.sh](mongo-soft-backup.sh)

I aquest seria el resultat de la execucio

```
root@instancia-backups:~/scripts# ./mongo-soft-backup.sh
2021-06-07T14:34:13.711+0000    writing nodebb.searchpost to dump/nodebb/searchpost.bson
2021-06-07T14:34:13.713+0000    writing nodebb.objects to dump/nodebb/objects.bson
2021-06-07T14:34:13.714+0000    writing nodebb.searchtopic to dump/nodebb/searchtopic.bson
2021-06-07T14:34:13.716+0000    done dumping nodebb.searchpost (5 documents)
2021-06-07T14:34:13.717+0000    done dumping nodebb.objects (1472 documents)
2021-06-07T14:34:13.717+0000    done dumping nodebb.searchtopic (4 documents)
2021-06-07T14:34:13.718+0000    writing nodebb.sessions to dump/nodebb/sessions.bson
2021-06-07T14:34:13.718+0000    done dumping nodebb.sessions (7 documents)
mongo-07-06-2021.tar                                         100%  220KB  95.9MB/s   00:00
root@instancia-backups:~/scripts#
```

## Copies Fitxers
Aquest script copia el contingut del directori on son els fitxers del servidor web i l'envia al servidor de backup via rsync. S'executa cada dia, i el dilluns (a les cinc del mati) crea un fitxer comprimit de la copia del dia

[fitxers-backups-rsync.sh](fitxers-backups-rsync.sh)

Resultat de la execucio

```
root@instancia-backups:~/scripts# ./fitxers-backups-rsync.sh
root@instancia-backups:~/scripts#
```

## Copies Fitxers segona versio
Aquest script copia el contingut del directori on son els fitxers del servidor web i l'envia al servidor de backup via rsync. S'executa cada dia. Per evitar que el servidor s'ompleni de copies diaries senceres, en el moment d'execucio, si NO es dilluns,  esborrarem la copia de la setmana anterior. Aixi mantenim copies setmanals.
Pero quant passen els mesos, pot ser nomes ens importen copies mensuals i aixi estalviem espai ja que un any te 12 mesos o 54 setmanes, per aixo, quan es dilluns i el dia del mes es superior a 7, s'esborrara la copia del mes anterior. D'aquesta manera es queda una copia del dilluns de la primera setmana de cada mes (o de la segona ja que el script es podria millorar).
Per ultim, per estalviar mes espai, generarem el .tar amb compressio, el que el convertira en .tar.gz

[fitxers-backups-rsync-v2.sh](fitxers-backups-rsync-v2.sh)

Resultat de la execucio

```
root@instancia-backups:~/scripts# ./fitxers-backups-rsync-v2.sh
tar: Removing leading `/' from member names
root@instancia-backups:~/scripts#
```