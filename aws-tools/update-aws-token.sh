#!/bin/bash

# Make sure this script is being sourced
if [[ $_ == $0 ]]; then
  echo "You must source this script!"
  exit 1
fi 

# Usage statement if not enough arguments passed in
[ $# -eq 0 ] && { echo "Usage: $0 <Session Name> <Account Number> <Role>"; exit 1; }

# Unset these first so they don't interfere with the CLI calls below
# Different tools look for different environment variables - Hooray for standardization...
unset AWS_ACCESS_KEY
unset AWS_ACCESS_KEY_ID

unset AWS_SECRET_KEY
unset AWS_SECRET_ACCESS_KEY

unset AWS_TOKEN
unset AWS_SESSION_TOKEN
unset AWS_SECURITY_TOKEN

# setting for assumerole api call
name_for_this_session=$1
 
# account that you want access to (will lead to error if you're not authorized)
account_no=$2
 
# role that you want access to (will lead to error if you're not authorized)
my_approved_role=$3
 
# how long will this token be valid for (min. 900, max. 3600)
valid_seconds=${seconds:=3600}
 
#### should not need to edit below this line
# the ARN for the role for which temporary token is to be generated format:
# arn_for_the_role="arn:aws:iam::TARGET_ACCOUNT_NO:role/TARGET_ROLE_NAME"
arn_for_the_role="arn:aws:iam::${account_no}:role/${my_approved_role}"
 
# optional: note the time at which keys were generated
generated_at=$(date -u "+%Y-%m-%dT%H:%M:%S")
 
# Call STS to get temporary creds
# Note that this call uses the 'corporate' AWS profile
temp_creds=$(aws sts assume-role \
                 --role-arn $arn_for_the_role \
                 --role-session-name $name_for_this_session \
                 --duration-seconds $valid_seconds \
                 --profile corporate \
                 --output json)
 
# Extract access and secret keys from response
aws_access_key_id=$(echo $temp_creds \
                | jq '.Credentials.AccessKeyId' \
                | sed -e 's/\"//g')
 
aws_secret_access_key=$(echo $temp_creds \
                    | jq '.Credentials.SecretAccessKey' \
                    | sed -e 's/\"//g')
 
aws_security_token=$(echo $temp_creds \
                 | jq '.Credentials.SessionToken' \
                 | sed -e 's/\"//g')

# Capture the time that the credentials will expire
expires_at=$(echo $temp_creds \
             | jq '.Credentials.Expiration'\
             | sed -e 's/\"//g' -e 's/Z//')

# Update the credentials on the 'temp' profile that lives in the ~/.aws/config file.
aws configure set aws_access_key_id $aws_access_key_id --profile temp
aws configure set aws_secret_access_key $aws_secret_access_key --profile temp
aws configure set aws_security_token $aws_security_token --profile temp

# Set the profile to 'temp'
export AWS_DEFAULT_PROFILE=temp

# Set the access key variables
export AWS_ACCESS_KEY=$aws_access_key_id
export AWS_ACCESS_KEY_ID=$aws_access_key_id

# Set the secret key variables
export AWS_SECRET_KEY=$aws_secret_access_key
export AWS_SECRET_ACCESS_KEY=$aws_secret_access_key

# Set the token variables
export AWS_TOKEN=$aws_security_token
export AWS_SESSION_TOKEN=$aws_security_token
export AWS_SECURITY_TOKEN=$aws_security_token

echo "==================================================="
echo "Assuming role ($3) in account ($2) at $generated_at"
echo "Role will expire at: $expires_at"
echo "==================================================="
