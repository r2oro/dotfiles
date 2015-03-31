# AWS Tools
A selection of tools that are useful for working with AWS.

You need to set the AWS_TOOLS_HOME environment variable for these to work.

I did this in my .bashrc file:
```
# Path to AWS tools
export AWS_TOOLS_PATH="$HOME/aws-tools"
```

# Update AWS Token
This is a Bash script that will request a temporary token from the Corporate managed STS instance.

Details are [here](https://devcloud.swcoe.ge.com/devspace/display/CLDSVC/Accounts%3A+Using+STS+to+Make+Temporary+Tokens+for+AWS).

The script will set environment variables as well as create a 'temp' profile in your AWS configuration file.

This script assumes that you have a 'corporate' profile in your ~/.aws/config file.
```
[default]
...

[profile sandbox]
aws_access_key_id=xxxxxxxxxxxxxx
aws_secret_access_key=xxxxxxxxxxxxxxxxxx
region=us-east-1
```

Important! This script sets environment variables, so it cannot be executed directly. Instead, you need to 'source' the script.

I did this in my .bashrc file:
```
# These are my AWS API access keys
export AWS_ACCESS_KEY=XXXXXXXXXXXXX
export AWS_SECRET_KEY=XXXXXXXXXXXXXXXXXXXX

# Aliased commands to request a token for pre-production roles
alias aws-preprod-user="source $AWS_TOOLS_PATH/update-aws-token.sh 200019822 028557712108 bu-user"
alias aws-preprod-poweruser="source $AWS_TOOLS_PATH/update-aws-token.sh 200019822 028557712108 bu-poweruser"

# Aliased commands to request a token for production roles
alias aws-prod-user="source $AWS_TOOLS_PATH/update-aws-token.sh 200019822 378058653094 bu-user"
alias aws-prod-poweruser="source $AWS_TOOLS_PATH/update-aws-token.sh 200019822 378058653094 bu-poweruser"
```

Now I can just run `aws-preprod-poweruser` when I want to be the poweruser in our pre-prod VPC...

# Proxy Switch
This is a Bash script that allows you to quickly turn the proxy on or off.

Important! This script sets environment variables, so it cannot be executed directly. Instead, you need to 'source' the script.

You need to have these environment variables already set for this to work:
* HTTP_PROXY_TEMP
* HTTPS_PROXY_TEMP
* NO_PROXY_TEMP

I did this in my .bashrc file:
```
# These variables hold the proxy settings to be switched on an off
export HTTP_PROXY_TEMP=http://proxy.research.ge.com:8080
export HTTPS_PROXY_TEMP=http://proxy.research.ge.com:8080
export NO_PROXY_TEMP=localhost,ge.com

# Aliased commands to turn the proxy on and off
alias proxyon="source $AWS_TOOLS_PATH/proxy-switch.sh on"
alias proxyoff="source $AWS_TOOLS_PATH/proxy-switch.sh off"
```

Now I can just run `proxyon` or `proxyoff` to switch the proxy settings...

Note that I have no_proxy set for ge.com, this is usually okay since ge.com is an internal DNS... for now...

Also, if you're coming in to the GE Network via the VPN, you'll need to use a different set of proxies...

```
export CORP_HTTP_PROXY_TEMP=http://cis-cinci-pitc-rest.proxy.corporate.gtm.ge.com:8080
export CORP_HTTPS_PROXY_TEMP=http://cis-cinci-pitc-rest.proxy.corporate.gtm.ge.com:8080
export CORP_NO_PROXY_TEMP=localhost,ge.com

alias corp_proxyon="source $AWS_TOOLS_PATH/proxy-switch.sh corp_on"
```
