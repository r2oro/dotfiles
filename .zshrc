# Path to your oh-my-zsh configuration.
export ZSH=$HOME/.dotfiles/oh-my-zsh

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

# GE Chef specific
# KNIFE_CONF_PATH=$HOME/chef/.chef/knife.rb
# KNIFE_COOKBOOK_PATH=$HOME/chef/cookbooks

# Which plugins would you like to load? (plugins can be found in ~/.dotfiles/oh-my-zsh/plugins/*)
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git docker brew github osx knife kitchen vagrant aws compleat dirpersist gem git-flow ssh-agent colorize autojump osx terraform)

if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

SHOW_AWS_PROMPT=false

export ZSH_DISABLE_COMPFIX=true
source $ZSH/oh-my-zsh.sh

# source ~/.nvm/nvm.sh

# Customize to your needs...
unsetopt correct


PATH=$HOME/bin:$PATH
# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
# export PATH="$PATH:$HOME/.rvm/bin"

# Proxy
test -e  "${HOME}/.proxy.sh" && source "${HOME}/.proxy.sh"
[[ -n "$http_proxy" ]] && export http_proxy
[[ -n "$https_proxy" ]] && export https_proxy

if [[ "$UID" != "0" ]]; then
  export EDITOR="atom -w"
  export USE_EDITOR=$EDITOR
  export VISUAL=$EDITOR
else
  unset EDITOR USE_EDITOR VISUAL
fi

export LESS=-XR

autoload -U zmv

# you don't need the following two now, but put them also in your .zshrc
alias zcp='zmv -C'
alias zln='zmv -L'

# GE AWS specific
# export CDPATH=$HOME:$HOME/chef/cookbooks
# alias arole='source $HOME/bin/set_aws_role.sh'
# alias aacc='source $HOME/bin/set_aws_account.sh'
# alias sts='source $HOME/bin/set_aws_sts_creds'
#
# #Cago
# alias cagol='source /usr/local/bin/cago.sh list'
# alias cagor='source /usr/local/bin/cago.sh refresh'
# alias cagos='source /usr/local/bin/cago.sh switch'
# alias cagou='source /usr/local/bin/cago.sh unset'
# export CAGO_CONFIG_URL=$HOME/.aws/cago.yaml

alias jqc='jq -C "."'
alias l=less

# GE Chef Aliases
# alias chprod='source $HOME/bin/swchef healthcare-prod'
# alias chdev='source $HOME/bin/swchef healthcare-dev'
# alias chdcar='source $HOME/bin/swchef dcar'
#
# alias chp-datalake='source $HOME/bin/swchef datalake'
# alias chp-energy='source $HOME/bin/swchef energy'
# alias chp-lab='source $HOME/bin/swchef lab'
# alias chp-myplant='source $HOME/bin/swchef myplant'
# alias chp-power-water='source $HOME/bin/swchef power-water'
# alias chp-pwr-sharedhr='source $HOME/bin/swchef pwr-sharedhr'
# alias chp-power-water-dev='source $HOME/bin/swchef power-water-dev'
#
# alias chnone='unset CHEF_SERVER_URL CHEF_PEM'

# GE Scalr Aliases
# alias sc-healthcare='export SCALRCLI_HOME=~/.scalr-healthcare'
# alias sc-corporate='export SCALRCLI_HOME=~/.scalr-corporate'
# alias sc-none='unset SCALRCLI_HOME'

# GE CloudPod Init
# source $HOME/.dotfiles/cloudpod.sh

# GE Automate Token
# export ATOK="s1Qvir5Cgx0Fej94_oKRDrx3TLA="

# GE Scalr
# eval "$(_SCALR_CTL_COMPLETE=source scalr-ctl)"

# GE OpennStack
# source ~/.dotfiles/_openstack.zsh

# ZSH iTerm2 integratation
test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

# Close shell only after 2 consecutive EOFs
setopt IGNORE_EOF

# run fortune on new terminal :)
fortune | cowsay | lolcat
