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

## Copies Fitxers
Aquest script copia el contingut del directori on son els fitxers del servidor web i l'envia al servidor de backup via rsync. S'executa cada dia, i el dilluns (a les cinc del mati) crea un fitxer comprimit de la copia del dia

[fitxers-backups-rsync.sh](fitxers-backups-rsync.sh)

Resultat de la execucio

```
root@instancia-backups:~/scripts# ./fitxers-backups-rsync.sh
root@instancia-backups:~/scripts#
```