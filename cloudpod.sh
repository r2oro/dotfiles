## set up terminal vim mode (optional, uncomment if desired)
# set -o vi

# ### BASH HISTORY AMONGST MULTIPLE TERMINALS ###
# export HISTCONTROL=ignoredups:erasedups # no duplicate entries
# export HISTSIZE=100000 # big big history
# export HISTFILESIZE=100000 # big big history
# shopt -s histappend # append to history, dont overwrite it
#
# # Save and reload the history after each command finishes
# export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
# export PAPIDIR="/Users/russellendicott/go/src/api-cache"
export PAPIDIR="/Users/arpi/go/src/api-cache"

## Git Completion stuff (If you want tab completion on git branches then follow these steps
## https://github.com/bobthecow/git-flow-completion/wiki/Install-Bash-git-completion) and
## uncomment the below.
# if [ -f ~/.git-completion.bash ]; then
#     . ~/.git-completion.bash
# fi

# ### NETWORK ###
# # GE proxy
# #http_proxy="http://3.40.45.27:80"
# http_proxy="http://10.114.16.12:80"
# #http_proxy="http://PITC-Zscaler-Americas-Cincinnati3PR.proxy.corporate.ge.com:80"
# https_proxy=$http_proxy
# HTTP_PROXY=$http_proxy
# HTTPS_PROXY=$http_proxy
# no_proxy="localhost, ge.com, 127.0.0.1, 3.0.0.0/8, 10.0.0.0/8"

# When on VPN, the proxy is not required to access *ge.com and will typically return HTTP 404 when attempting to do so.
export https_proxy http_proxy HTTP_PROXY HTTPS_PROXY no_proxy

# GE proxy aliases
alias ge_proxy_on='http_proxy="http://10.114.16.12:80" https_proxy=$http_proxy HTTP_PROXY=$http_proxy HTTPS_PROXY=$http_proxy EC2_JVM_ARGS="-Dhttps.proxyHost=10.114.16.12 -Dhttps.proxyPort=80"; export http_proxy https_proxy HTTP_PROXY HTTPS_PROXY EC2_JVM_ARGS'
alias ge_proxy_off='unset http_proxy https_proxy HTTP_PROXY HTTPS_PROXY EC2_JVM_ARGS'

# clear aws env vars
alias clear_aws_env='unset AWS_ACCESS_KEY_ID AWS_SECRET_ACCESS_KEY AWS_SESSION_TOKEN AWS_DEFAULT_REGION'

## Once you have your clapshot key, enter it here and uncomment
# export PCT_API_READ_KEY="2F11111111112345678765434567656vB3t9iyZdfYr"
# export READ_API_KEY=$PCT_API_READ_KEY

## Once you have your NAAPI valley API key enter it here
# export API_KEY_NAAPI_WRAAPI="tp12345tewq132435466yrterwe312435aiDx1"

## Once you have your IAM the LAW API key enter it here
# export IAMTHELAWAPIKEY="9456789876546789o7654rfghjuytgDP"

## Once you have your Hashicorp Vault API token for SSH signing
## enter it here.
# export VAULT_TOKEN="213245-12345-123456-1345"

## Enter your MFA token for geadmin here once you have your
## geadmin login created. Change the SSO obviously.
export MFA="arn:aws:iam::589623221417:mfa/212481589"

## Some things use our own pypi server. If you want to use that then
## uncomment the below lines
# export PIP_INDEX_URL="https://pypi.cloudpod.apps.ge.com/ge/production/+simple/"
# export PIP_TRUSTED_HOST="pypi.cloudpod.apps.ge.com"
# alias poo_off='unset PIP_INDEX_URL PIP_TRUSTED_HOST'

## gossamer starter commands

## Assumes all the roles listed in roles.json using the starter profile of giam and outputs to ~/.aws/credentials
alias gossall='/usr/local/bin/gossamer -rolesfile ~/gossamer/roles.json -profile giam -serialnumber $MFA -o ~/.aws/credentials -force -tokencode'
## Assumes the one role admin-to-gecc using the profile pcpoot and outputs the entry as pctpooter to ~/.aws/credentials
alias gossone='/usr/local/bin/gossamer -a arn:aws:iam::737859062117:role/admin-to-gecc -profile pcpoot -o ~/.aws/credentials -force -entryname pcpooter'

# helpful for setting proxies before a docker build
alias dbuild='docker build --build-arg http_proxy=http://10.114.16.12:80 --build-arg https_proxy=http://10.114.16.12:80 --build-arg no_proxy="localhost,127.0.0.1,ge.com,3.0.0.0/8,10.0.0.0/8" . -t'

alias drgossycv='docker run -v ~/source/collectd-monitoring:/tmp/source/zboi -i -t jumpy'
alias drgossydv='docker run -e VAULT_TOKEN=$VAULT_TOKEN -i -t jumpy'
alias drgossyhv='docker run -e VAULT_TOKEN -v ~/haswapper:/tmp/source/zboi -i -t jumpy'
alias drgossyiv='docker run -e VAULT_TOKEN -v ~/source/collectd-monitoring:/tmp/source/zboi -i -t jumpy'

## run master-jump container, passing in your local env var for VAULT_TOKEN
## and mount a folder from your machine's ~/source folder to the /tmp/source/zboi folder in the container
alias mrgossyb='docker run -e VAULT_TOKEN -v ~/source/bindconfigs:/tmp/source/zboi -i -t master-jump'

## Some helper shortcuts for terraform
alias tfa='terraform apply'
alias tfi='terraform init'
alias tfp='terraform plan'

## For RDP to windows servers
## SSH's to the copsbastion box using the entry stored in ~/.ssh/config
## then keeps a tunnel open to 10.231.46.18:3389 that is accessible
## by going to 127.0.0.01:3399 on your local machine. Therefore you
## get to the windows machine by RDP'ing to 127.0.0.1:3390
alias winders="ssh -L 3399:10.231.46.18:3389 copsbastion"

# ## helper aliases I use to quickly edit ~/.bashrc then
# ## source it when i'm done.
# alias sauce="source ~/.bashrc"
# alias fish="vi ~/.bashrc"
#
# ## helper alias to quickly type "git commit -m" with a commit message
# alias gcm="git commit -m"

## Helper stuff for using the custom fhid service for image lookups
export FHID_URL="https://images.cloudpod.apps.ge.com/v1.0/images"
export FHID_URL_QUERY="https://images.cloudpod.apps.ge.com/v1.0/query"
alias fhidler="~/fhidler/fhidler -fhid-url $FHID_URL_QUERY -ami-id"

# ## When using cagophilist it's nice to store your config in github
# export CAGO_CONFIG_URL="https://github.build.ge.com/raw/212601587/cpod-cago-config/master/cago-config.yml"
# alias cagol='source /usr/local/bin/cago.sh list'
# alias cagor='source /usr/local/bin/cago.sh refresh'
# alias cagos='source /usr/local/bin/cago.sh switch'
# alias cagou='source /usr/local/bin/cago.sh unset'

## Once you have a clapshot key entered in this file this command will run a quick test on clapshot
alias testclapshot='curl -s GET -H "x-api-key: $PCT_API_READ_KEY" -H "Cache-Control: no-cache" -k "https://pctapi.cloudpod.apps.ge.com/aws/v2.1/accounts?limit=1"'
