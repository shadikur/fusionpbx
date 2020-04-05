#!/bin/sh
now=$(date +%Y-%m-%d)
ssh_server=x.x.x.x
database_host=127.0.0.1
database_port=5432
export PGPASSWORD="zzz"

#run the remote backup
#ssh -p 22 root@$ssh_server "nice -n -20 /etc/cron.daily/./fusionpbx-backup.sh"

#delete freeswitch logs older 7 days
find /var/log/freeswitch/freeswitch.log.* -mtime +7 -exec rm {} \;

#synchronize the backup directory
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/var/backups/fusionpbx /var/backups
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/var/backups/fusionpbx/postgresql /var/backups/fusionpbx
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/var/www/fusionpbx /var/www
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/etc/fusionpbx /etc
#find /var/backups/fusionpbx/postgresql -mtime +2 -exec rm {} \;

#rsync -avz -e 'ssh -p 22' root@$ssh_server:/etc/freeswitch/ /etc
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/var/lib/freeswitch/storage /var/lib/freeswitch
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/var/lib/freeswitch/recordings /var/lib/freeswitch
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/usr/share/freeswitch/scripts /usr/share/freeswitch
#rsync -avz -e 'ssh -p 22' root@$ssh_server:/usr/share/freeswitch/sounds /usr/share/freeswitch

echo "Restoring the Backup"
#extract the backup from the tgz file
#tar -xvpzf /var/backups/fusionpbx/backup_$now.tgz -C /

#remove the old database
psql --host=$database_host --port=$database_port  --username=fusionpbx -c 'drop schema public cascade;'
psql --host=$database_host --port=$database_port  --username=fusionpbx -c 'create schema public;'
#restore the database
pg_restore -v -Fc --host=$database_host --port=$database_port --dbname=fusionpbx --username=fusionpbx /var/backups/fusionpbx/postgresql/fusionpbx_pgsql_$now.sql

#restart freeswitch
service freeswitch restart
echo "Restore Complete";
