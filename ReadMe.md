# Team Delta Glint Dev scripts
This is Team Deltas Glint Dev scripts. Which can be useful for end to end deployment and development. Since the team leverage both personal devices and dev boxes having a centralized repo that one could pull from will help us easily keep our WSL systems up to date.

# Setup 
- You can leverage by adding the main.sh source file to your .bashrc. This will source all the other bash scripts within this folder. 
For example in my .bashrc
```
source ~/dev/scripts/main.sh # Since this is the location of this repo.
```
- You will need to setup the file called configuration.sh with your local path and credentials. This should never be committed into this repo as it is a security risk. By default all files that start with "__" will be ignored. Copy the configurationBackup.sh file and rename it to be __configuration.sh and fill in the required information.

