#!/bin/sh
#
# usage: retrieve-cert.sh remote.host.name [port]

# Usage statement if not enough arguments passed in
[ $# -eq 0 ] && { echo "Usage: $0 <host> [port]"; exit 1; }

REMHOST=$1
REMPORT=${2:-443}
 
echo |\
openssl s_client -connect ${REMHOST}:${REMPORT} 2>&1 |\
sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p'
