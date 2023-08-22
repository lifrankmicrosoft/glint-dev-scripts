# UI paths
uimtpath="$uipath/sources/dev/middle-tier"
uicorepath="$uipath/sources/dev/core"
uifixturepath="$uipath/sources/dev/strings"

# UI go to shortcuts
alias ui="cd $uipath"
alias uimt="cd $uimtpath"
alias uicore="cd $uicorepath"
alias uifixture="cd $uifixturepath"

# Fixture: UI String Translation 
alias uifixturebuild="uifixture; rushx build"

# UI Middletier
alias uimtconfig="cd $uimt/config"
alias uimtinstall="ui; node common/scripts/install-run-rush install"
alias uimtbuild="ui; uimtinstall; node common/scripts/install-run-rush build; uifixturebuild"
alias uimtrun="takedownuimt; uimt; rushx start"
alias uimttest='uimt; rushx test'

# UI Core (Glint UI)
alias uicorewatch="uicore; rushx watch:ui"
alias uicoretest="uicore; rushx test"
alias uirmnodemodules="cd $uipath/common/temp; rm -r node_modules"
alias uilint='uicore; rushx lint-style-fix;  rushx lint-fix; rushx prettier; rushx format'
alias uitest='uicore; rushx test'
alias uicorserve='uicore; rushx serve' # this runs local glint ui through angular with hot reloading

function uirun() {
    tmux has-session -t uirun && tmux kill-session -t uirun;
    uicore; rush install;
    tmux new-session -d -s "uirun" 'bash -c "uicore; npm run watch:session"' \; \
    split-window -v 'bash -c "uicore; npm run watch:session-aad"' \; \
    split-window -v 'bash -c "uicore; npm run watch:unsubscribe"' \; \
    split-window -h 'bash -c "uicore; npm run watch:questionnaire"' \; \
    split-window -h 'bash -c "uicore; npm run watch:style-guide"' \; \
    split-window -h 'bash -c "uicore; npm run watch:ui"' \; \
    select-layout even-vertical \; \
    attach-session -d
}

alias uitestall='uimtbuild && uimttest && uitest'
alias uipr='uilint && uitestall' # running this before creating PR will detect issues early on


