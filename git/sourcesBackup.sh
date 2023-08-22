export frankpersonalpath="$devpath/personal/FrankPersonal"
export frankpersonalscriptspath="$frankpersonalpath/scripts"
alias frankpersonal="cd $frankpersonalpath"
alias fcopybashrc="cp ~/.bashrc $frankpersonalscriptspath/.bashrc; frankpersonal; git add scripts/.bashrc; git commit -m 'saving .bashrc'; git push"
