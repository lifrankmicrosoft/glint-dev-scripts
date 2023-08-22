| Command                  | Description                                                                                                      |
|--------------------------|------------------------------------------------------------------------------------------------------------------|
| `startrabbitmq`          | Stops, starts, and checks the status of the RabbitMQ server using `systemctl`.                                   |
| `startmysql`             | Stops, starts, and checks the status of the MySQL server using `systemctl`.                                      |
| `startredis`             | Stops, starts, and checks the status of the Redis server using `systemctl`.                                      |
| `startelasticsearch`     | Stops, starts, and checks the status of the Elasticsearch server using `systemctl`.                              |
| `be`                     | Navigates to the directory defined in `$bepath`.                                                                |
| `bebuild`                | Navigates to `$bepath`, cleans and installs the Maven project while skipping tests and SpotBugs.                 |
| `m2`                     | Opens the Maven settings.xml in nano for editing.                                                               |
| `takedownfunc`           | Kills the process listening on the provided port number.                                                         |
| `takedownsputnik`        | Kills the process listening on port 18081.                                                                      |
| `takedownworkflow`       | Kills the process listening on port 8888.                                                                       |
| `betakedown`             | Kills processes on ports 18081 and 8888.                                                                        |
| `takedownuimt`           | Kills processes on ports 8000 and 18081.                                                                        |
| `takedownall`            | Executes `betakedown` and `uitakedown` commands.                                                                |
| `fsql`                   | Logs into MySQL with predefined credentials on port 3306.                                                        |
| `configsql`              | Opens MySQL configuration in nano for editing.                                                                  |
| `fcommand`               | Executes the provided MySQL command with predefined credentials.                                                 |
| `sqldump`                | Navigates to the directory defined in `$sqldumppath`.                                                           |
| `qadumpall`              | Dumps all databases from a QA host excluding certain system databases.                                          |
| `demo2dump`              | Dumps the `demo2` database from the defined QA host.                                                            |
| `devdata2dump`           | Dumps the `dev_data2` database from the defined QA host.                                                        |
| `exportLocaldemo2`       | Dumps the `demo2` database from the local MySQL setup to the `$sqldumppath` directory.                          |
