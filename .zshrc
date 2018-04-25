# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh
export EDITOR="atom -w"
export USE_EDITOR=$EDITOR
export VISUAL=$EDITOR

# Set name of the theme to load.
# Look in $ZSH/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#export ZSH_THEME="ys"
#export ZSH_THEME="random"
export ZSH_THEME="ys_chef"

# Set to this to use case-sensitive completion
export CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# export DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# export DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# export DISABLE_AUTO_TITLE="true"

KNIFE_CONF_PATH=$HOME/chef/.chef/knife.rb
KNIFE_COOKBOOK_PATH=$HOME/chef/cookbooks

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew github osx rvm knife kitchen vagrant aws compleat dirpersist gem git-flow ssh-agent colorize osx)

source $ZSH/oh-my-zsh.sh

# source ~/.nvm/nvm.sh

# Customize to your needs...
unsetopt correct

# export PATH="/Users/antic/.rbenv/shims:${PATH}"
# source "/usr/local/Cellar/rbenv/0.4.0/libexec/../completions/rbenv.zsh"
# rbenv rehash 2>/dev/null
# rbenv() {
#   typeset command
#   command="$1"
#   if [ "$#" -gt 0 ]; then
#     shift
#   fi
#
#   case "$command" in
#   rehash|shell)
#     eval `rbenv "sh-$command" "$@"`;;
#   *)
#     command rbenv "$command" "$@";;
#   esac
# }

# run fortune on new terminal :)
fortune | cowsay | lolcat
# fortune | cowsay

autoload -U zmv
# you don't need the following two now, but put them also in your .zshrc
alias zcp='zmv -C'
alias zln='zmv -L'

export LESS=-XR
PATH=$HOME/bin:$PATH
export CDPATH=$HOME:$HOME/chef/cookbooks
alias arole='source $HOME/bin/set_aws_role'
alias aacc='source $HOME/bin/set_aws_account'
alias sts='source $HOME/bin/set_aws_sts_creds'

#Cago
alias cagol='source /usr/local/bin/cago.sh list'
alias cagor='source /usr/local/bin/cago.sh refresh'
alias cagos='source /usr/local/bin/cago.sh switch'
alias cagou='source /usr/local/bin/cago.sh unset'
export CAGO_CONFIG_URL=$HOME/.aws/cago.yaml

alias jqc='jq -C "."'

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
