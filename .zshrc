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
plugins=(git docker brew github osx knife kitchen vagrant aws compleat dirpersist gem git-flow ssh-agent colorize autojump osx terraform)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

source $ZSH/oh-my-zsh.sh

# source ~/.nvm/nvm.sh

# Customize to your needs...
unsetopt correct

# run fortune on new terminal :)
fortune | cowsay | lolcat
# fortune | cowsay

autoload -U zmv
# you don't need the following two now, but put them also in your .zshrc
alias zcp='zmv -C'
alias zln='zmv -L'

export LESS=-XR
PATH=$HOME/bin:/usr/local/opt/ruby/bin:$PATH
export CDPATH=$HOME:$HOME/chef/cookbooks
alias arole='source $HOME/bin/set_aws_role.sh'
alias aacc='source $HOME/bin/set_aws_account.sh'
alias sts='source $HOME/bin/set_aws_sts_creds'

#Cago
alias cagol='source /usr/local/bin/cago.sh list'
alias cagor='source /usr/local/bin/cago.sh refresh'
alias cagos='source /usr/local/bin/cago.sh switch'
alias cagou='source /usr/local/bin/cago.sh unset'
export CAGO_CONFIG_URL=$HOME/.aws/cago.yaml

alias jqc='jq -C "."'
alias l=less

# Chef Aliases
alias chprod='source $HOME/bin/swchef prod'
alias chdev='source $HOME/bin/swchef dev'
alias chdcar='source $HOME/bin/swchef dcar'
alias choprod='source $HOME/bin/swchef oprod'
alias chodev='source $HOME/bin/swchef odev'
alias chtprod='source $HOME/bin/swchef tprod'
alias chtdev='source $HOME/bin/swchef tdev'
alias chnone='unset CHEF_SERVER_URL'

# Close shell only after 2 consecutive EOFs
setopt IGNORE_EOF

# CloudPod Init
source $HOME/.dotfiles/cloudpod.sh

# Automate Token
export ATOK="s1Qvir5Cgx0Fej94_oKRDrx3TLA="

# Shell line editing

# Proxy
. ~/.proxy.sh
[[ -n "$http_proxy" ]] && export http_proxy
[[ -n "$https_proxy" ]] && export https_proxy


test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

eval "$(_SCALR_CTL_COMPLETE=source scalr-ctl)"
