# This is for dumping and importing into our local SQL

alias fsql='mysql -u root --password=root -h localhost -P 3306'
alias configsql='sudo nano /etc/mysql/mysql.conf.d/mysqld.cnf'
function fcommand() {
  mysql -u root --password=root -h localhost -P 3306 -e "$1"
}
alias sqldump='cd $sqldumppath'
function qadumpall() {
    sqldump;
    databases=$(mysql -u fli@$sqlqahost -h $sqlqahost -p"$sqlqapassword" -e "SHOW DATABASES;" | tr -d "| " | grep -v Database)

    for db in $databases; do
        if [ "$db" != "information_schema" ] && [ "$db" != "performance_schema" ] && [ "$db" != "mysql" ] && [ "$db" != _* ] ; then
            echo "Starting backup for database - $db"
            mysqldump -u fli@$sqlqahost -h $sqlqahost -p"$sqlqapassword" $db --single-transaction --quick | pv > "$db.sql"
            if [ $? -eq 0 ]; then
                echo "Backup completed for $db"
            else
                echo "Backup failed for $db"
            fi
        fi
    done
}
function demo2dump() {
    sqldump;
    mysqldump -u fli@$glintqahost -h $glintqahost -$glintqapassword demo2 --single-transaction --quick | pv --progress > demo2.sql
}

function devdata2dump() {
    sqldump;
    mysqldump -u fli@$glintqadevdata2host -h $glintqadevdata2host -$glintqadevdata2password dev_data2 --single-transaction --quick | pv --progress > dev_data2.sql
}

function exportLocaldemo2(){
    cd $sqldumppath;
    mysqldump -u root --password=root -h localhost -P 3306 demo2 > demo2.sql
}

