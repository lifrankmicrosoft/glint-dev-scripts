# UI paths
uimtpath="$uipath/sources/dev/middle-tier"
uicorepath="$uipath/sources/dev/core"
uifixturepath="$uipath/sources/dev/strings"

export NODE_ENV='local'

# UI go to shortcuts
alias ui="cd $uipath"
alias uimt="cd $uimtpath"
alias uicore="cd $uicorepath"
alias uifixture="cd $uifixturepath"

# Fixture: UI String Translation 
alias uifixturebuild="uifixture; rushx build"

# UI Middletier
alias uimtconfig="cd $uimt/config"

function uimtinstallinner() {
    ui
    node common/scripts/install-run-rush install
}
function uimtinstall() {
    measuretime uimtinstallinner
}

function uimtbuildinner() {
    ui
    node common/scripts/install-run-rush install
}
function uimtbuild() {
    measuretime uimtbuildinner
}

function uimtruninner() {
    takedownuimt
    uimt
    rushx start
}
function uimtrun() {
    measuretime uimtruninner
}

function uimttestinner() {
    uimt
    rushx test
}
function uimttest() {
    measuretime uimttestinner
}

# UI Core (Glint UI)
alias uicorewatch="uicore; rushx watch:ui"

alias uirmnodemodules="cd $uipath/common/temp; rm -r node_modules"
alias uicoreserve='uicore; rushx serve' # this runs local glint ui through angular with hot reloading

function uicoretestinner() {
    uicore
    rushx test
}
function uicoretest() {
    measuretime uicoretestinner
}

function uilintinner() {
    uicore
    rushx lint-style-fix
    rushx lint-fix
    rushx prettier
    rushx format
}
function uilint() {
    measuretime uilintinner
}

function uitestallinner() {
    uimtbuild
    uimttest
    uitest
}
function uitestall() {
    measuretime uitestallinner
}

function uirun() {
    tmux has-session -t uirun && tmux kill-session -t uirun
    uicore
    rush install
    tmux new-session -d -s "uirun" 'bash -c "uicore; npm run watch:session"' \
        split-window -v 'bash -c "uicore; npm run watch:session-aad"' \
        split-window -v 'bash -c "uicore; npm run watch:unsubscribe"' \
        split-window -h 'bash -c "uicore; npm run watch:questionnaire"' \
        split-window -h 'bash -c "uicore; npm run watch:style-guide"' \
        split-window -h 'bash -c "uicore; npm run watch:ui"' \
        select-layout even-vertical \
        attach-session -d
}

alias uipr='uilint && uitestall' # running this before creating PR will detect issues early on
