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
| `uicorserve`            | Navigates to the core directory and serves the local Glint UI with hot reloading through Angular.                               |
| `uirun()`               | Function that initializes or reinitializes a tmux session with various watch commands for different UI aspects.                |
| `uitestall`             | Runs build and test scripts for both the middle-tier and the core UI.                                                                        |
| `uipr`                  | Runs linting and a comprehensive test suite, intended to be used before creating a Pull Request to detect issues early on.  |
