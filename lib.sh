#!/usr/bin/env bash

###
# some bash library helpers
# @author Adam Eivy
###

# Colors
ESC_SEQ="\x1b["
COL_RESET=$ESC_SEQ"39;49;00m"
COL_RED=$ESC_SEQ"31;01m"
COL_GREEN=$ESC_SEQ"32;01m"
COL_YELLOW=$ESC_SEQ"33;01m"
COL_BLUE=$ESC_SEQ"34;01m"
COL_MAGENTA=$ESC_SEQ"35;01m"
COL_CYAN=$ESC_SEQ"36;01m"

function ok() {
    echo -e "$COL_GREEN[ok]$COL_RESET "$1
}

function bot() {
    echo -e "\n$COL_GREEN( ͡° ͜ʖ ͡°)$COL_RESET - "$1
}

function running() {
    echo -en "$COL_YELLOW ⇒ $COL_RESET"$1": "
}

function action() {
    echo -e "\n$COL_YELLOW[action]:$COL_RESET\n ⇒ $1..."
}

function warn() {
    echo -e "$COL_YELLOW[warning]$COL_RESET "$1
}

function error() {
    echo -e "$COL_RED[error]$COL_RESET "$1
}

function require_cask() {
    running "brew install --cask $1"
    app=`brew info --cask $1 | sed -n '/(app)$/s/ (app)//p'`
    if [[ -n "$app" ]] && [[ -d "/Applications/$app" ]]; then
      action "Application /Applications/$app already installed"
      ok
      return 0
    fi
    brew list --cask $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew install --cask $1 $2"
        brew install --cask $1
        if [[ $? != 0 ]]; then
            error "failed to install $1!"
            # exit -1
        fi
    fi
    ok
}

function require_brew() {
    running "brew $1 $2"
    brew list $1 > /dev/null 2>&1 | true
    if [[ ${PIPESTATUS[0]} != 0 ]]; then
        action "brew install $1 $2"
        brew install $1 $2
        if [[ $? != 0 ]]; then
            error "failed to install $1! aborting..."
            exit -1
        fi
    fi
    ok
}

function require_gem() {
    running "gem $1"
    if [[ $(gem list --local | grep $1 | head -1 | cut -d' ' -f1) != $1 ]];
        then
            action "gem install $1"
            gem install $1
    fi
    ok
}

# npmlist=`npm list -g`
# function require_npm() {
#     running "npm $1"
#     echo $npmlist | grep $1@ > /dev/null
#     if [[ $? != 0 ]]; then
#         action "npm install -g $1"
#         npm install -g $1
#     fi
#     ok
# }

function require_node(){
    running "node -v"
    node -v
    if [[ $? != 0 ]]; then
        action "node not found, installing via homebrew"
        brew install node
    fi
    ok
}

function require_apm() {
    running "checking atom plugin: $1"
    apm list --installed --bare | grep $1@ > /dev/null
    if [[ $? != 0 ]]; then
        action "apm install $1"
        apm install $1
    fi
    ok
}

function require_vagrant_plugin() {
    running "vagrant plugin $1"
    local vagrant_plugin=$1
    local vagrant_plugin_version=$2
    local grepExpect=$vagrant_plugin
    local grepStatus=$(vagrant plugin list | grep $vagrant_plugin)

    if [[ ! -z $vagrant_plugin_version ]]; then
        grepExpect=$grepExpect' ('$vagrant_plugin_version')'
    else
        # we are only looking for the name
        grepStatus=${grepStatus%% *}
    fi

    #echo 'checking if '$grepExpect' is installed via grepStatus: '$grepStatus

    if [[ $grepStatus != $grepExpect ]];
        then
            action "installing vagrant plugin $1 $2"
            if [[ ! -z $vagrant_plugin_version ]]; then
                vagrant plugin install $vagrant_plugin --plugin-version $vagrant_plugin_version
            else
                vagrant plugin install $vagrant_plugin
            fi
    fi
    ok
}
function symlinkifne {
    running "$1"

    if [[ -e $1 ]]; then
        # file exists
        if [[ -L $1 ]]; then
            # it's already a simlink (could have come from this project)
            echo -en '\tsimlink exists, skipped\t';ok
            return
        fi
        # backup file does not exist yet
        if [[ ! -e ~/.dotfiles_backup/$1 ]];then
            mv $1 ~/.dotfiles_backup/
            echo -en 'backed up saved...';
        fi
    fi
    # create the link
    ln -s ~/.dotfiles/$1 $1
    echo -en '\tlinked';ok
}
