- [Team Delta Glint Dev scripts](#team-delta-glint-dev-scripts)
- [Setup](#setup)
- [Commands](#commands)
  - [Backend](#backend)
  - [Frontend](#frontend)
  - [WSL Commands](#wsl-commands)
  - [Git helpers](#git-helpers)


# Team Delta Glint Dev scripts
This is Team Deltas Glint Dev scripts. Which can be useful for end to end deployment and development. Since the team leverage both personal devices and dev boxes having a centralized repo that one could pull from will help us easily keep our WSL systems up to date.

# Setup 
- You can leverage by adding the main.sh source file to your .bashrc. This will source all the other bash scripts within this folder. 
For example in my .bashrc
```
export glintscriptspath='~/dev/scripts' # the location to this repo
source ~/dev/scripts/main.sh # Since this is the location of this repo.
```
- You will need to setup the file called configuration.sh with your local path and credentials. This should never be committed into this repo as it is a security risk. By default all files that start with "__" will be ignored. Copy the configurationBackup.sh file and rename it to be __configuration.sh and fill in the required information.


# Commands
## Backend
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

## Frontend
| Command                 | Description                                                                                                                |
|-------------------------|----------------------------------------------------------------------------------------------------------------------------|
| `uimtpath`              | Path to the middle-tier directory in UI sources.                                                                                           |
| `uicorepath`            | Path to the core directory in UI sources.                                                                                                 |
| `uifixturepath`         | Path to the strings directory in UI sources.                                                                                              |
| `ui`                    | Changes the directory to the base UI path (`$uipath`).                                                                                           |
| `uimt`                  | Navigates to the middle-tier directory in UI sources.                                                                                    |
| `uicore`                | Navigates to the core directory in UI sources.                                                                                              |
| `uifixture`             | Navigates to the strings directory in UI sources.                                                                                          |
| `uifixturebuild`        | Navigates to the strings directory and runs the `rushx build` command.                                                                  |
| `uimtconfig`            | Navigates to the config directory inside the middle-tier directory in UI sources.                                                   |
| `uimtinstall`           | Goes to the UI base path, runs a common install script for the rush project.                                                            |
| `uimtbuild`             | Sequences various commands to install, build, and update UI projects and fixtures.                                                   |
| `uimtrun`               | Shuts down middle-tier, navigates to the middle-tier directory, and starts the project using `rushx start`.                |
| `uimttest`              | Navigates to the middle-tier directory and runs tests using `rushx test`.                                                           |
| `uicorewatch`           | Navigates to the core directory and starts the watch for UI changes using `rushx watch:ui`.                                          |
| `uicoretest`            | Navigates to the core directory and runs tests using `rushx test`.                                                                        |
| `uirmnodemodules`       | Navigates to the temp directory in common and removes the `node_modules` directory.                                                  |
| `uilint`                | Navigates to the core directory and runs various linting and formatting scripts.                                                        |
| `uitest`                | Navigates to the core directory and runs tests using `rushx test`.                                                                        |
| `uicoreserve`            | Navigates to the core directory and serves the local Glint UI with hot reloading through Angular.                               |
| `uirun()`               | Function that initializes or reinitializes a tmux session with various watch commands for different UI aspects.                |
| `uitestall`             | Runs build and test scripts for both the middle-tier and the core UI.                                                                        |
| `uipr`                  | Runs linting and a comprehensive test suite, intended to be used before creating a Pull Request to detect issues early on.  |

## WSL Commands
| Command                  | Description                                                                                                                                                   |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `fsource`                | Reloads the `.bashrc` configuration by sourcing it.                                                                                                           |
| `fsave`                  | Opens `.bashrc` in nano for editing, reloads the configuration, then copies the bashrc (assuming `fcopybashrc` does that).                                    |
| `fcode`                  | Opens `.bashrc` in Visual Studio Code.                                                                                                                        |
| `ideraw`                 | Kills any running IntelliJ IDEA processes and then starts IntelliJ IDEA without detaching it from the terminal.                                               |
| `ide`                    | Kills any running IntelliJ IDEA processes and starts IntelliJ IDEA in the background.                                                                         |
| `webstormraw`            | Kills any running WebStorm processes and then starts WebStorm without detaching it from the terminal.                                                         |
| `webstorm`               | Kills any running WebStorm processes and starts WebStorm in the background.                                                                                   |
| `githubdesktop`          | Kills any running GitHub Desktop processes and starts GitHub Desktop in the background.                                                                       |
| `launchall`              | Starts IntelliJ IDEA, WebStorm, and GitHub Desktop in the background.                                                                                         |
| `takedownide`            | Kills any running IntelliJ IDEA processes.                                                                                                                    |
| `takedowngithubdesktop`  | Kills any running GitHub Desktop processes.                                                                                                                   |
| `takedownwebstorm`       | Kills any running WebStorm processes.                                                                                                                         |

## Git helpers
| Command                  | Description                                                                                                                                                   |
|--------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| `gitfetchall`                | gets all the branches available from remote                                                                                                          |
