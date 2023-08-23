# These are for launching and taking down various software in WSL

alias ideraw="takedownide; sh $intellijProPath/idea.sh"
alias ide="takedownide; nohup sh $intellijProPath/idea.sh  > /dev/null 2>&1 &"
alias webstormraw="takedownwebstorm; sh $webstormpath/webstorm.sh"
alias webstorm="takedownwebstorm; nohup sh $webstormpath/webstorm.sh > /dev/null 2>&1 &"
alias githubdesktop="takedowngithubdesktop; nohup github-desktop > /dev/null 2>&1 &"

alias launchall="ide; webstorm; githubdesktop"

alias takedownide='pgrep -f "idea.*sh" | xargs kill -9'
alias takedowngithubdesktop="pkill -f github-desktop"
alias takedownwebstorm='pgrep -f "webstorm.*sh" | xargs kill -9'
