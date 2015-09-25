#!/bin/bash

# Make sure this script is being sourced
if [[ $_ == $0 ]]; then
  echo "You must source this script!"
  exit 1
fi

# Make sure all the requisite environment variables are already set
if [ -z "${HTTP_PROXY_TEMP}" ] || [ -z "${HTTPS_PROXY_TEMP}" ] || [ -z "${NO_PROXY_TEMP}" ]; then
  echo "The following environment variables must be defined:"
  echo "   - HTTP_PROXY_TEMP"
  echo "   - HTTPS_PROXY_TEMP"
  echo "   - NO_PROXY_TEMP"

  echo "   - VPN_HTTP_PROXY_TEMP"
  echo "   - VPN_HTTPS_PROXY_TEMP"
  echo "   - VPN_NO_PROXY_TEMP"
  return 1
fi

# Turn the proxy on or off
case "$1" in
        on)
            # Swap in the temp values
            echo "Enabling proxy..."
            export HTTP_PROXY=$HTTP_PROXY_TEMP
            export http_proxy=$HTTP_PROXY_TEMP
            export HTTPS_PROXY=$HTTPS_PROXY_TEMP
            export https_proxy=$HTTPS_PROXY_TEMP
            export NO_PROXY=$NO_PROXY_TEMP
            export no_proxy=$NO_PROXY_TEMP
            export VAGRANT_HTTP_PROXY=$HTTP_PROXY_TEMP
            export VAGRANT_HTTPS_PROXY=$HTTP_PROXY_TEMP
            export VAGRANT_FTP_PROXY=$HTTP_PROXY_TEMP
            export VAGRANT_NO_PROXY=$NO_PROXY_TEMP

            ;;

        vpn_on)
            # Swap in the temp values
            echo "Enabling VPN proxy..."
            export HTTP_PROXY=$VPN_HTTP_PROXY_TEMP
            export http_proxy=$VPN_HTTP_PROXY_TEMP
            export HTTPS_PROXY=$VPN_HTTPS_PROXY_TEMP
            export https_proxy=$VPN_HTTPS_PROXY_TEMP
            export NO_PROXY=$VPN_NO_PROXY_TEMP
            export no_proxy=$VPN_NO_PROXY_TEMP
            export VAGRANT_HTTP_PROXY=$VPN_HTTP_PROXY_TEMP
            export VAGRANT_HTTPS_PROXY=$VPN_HTTP_PROXY_TEMP
            export VAGRANT_FTP_PROXY=$VPN_HTTP_PROXY_TEMP
            export VAGRANT_NO_PROXY=$VPN_NO_PROXY_TEMP

            ;;

        off)
            # Clear the environment variables
            echo "Disabling proxy..."
            unset HTTP_PROXY
            unset http_proxy
            unset HTTPS_PROXY
            unset https_proxy
            unset NO_PROXY
            unset no_proxy
            unset VAGRANT_HTTP_PROXY
            unset VAGRANT_HTTPS_PROXY
            unset VAGRANT_FTP_PROXY
            unset VAGRANT_NO_PROXY
            ;;

        myapps)
            # Swap in the temp values
            echo "Enabling proxy..."
            export HTTP_PROXY="http://myapps.setpac.ge.com/pac.pac"
            export http_proxy=$HTTP_PROXY
            export HTTPS_PROXY=$HTTP_PROXY
            export https_proxy=$HTTP_PROXY
            export NO_PROXY=$NO_PROXY_TEMP
            export no_proxy=$NO_PROXY_TEMP
            export VAGRANT_HTTP_PROXY=$HTTP_PROXY
            export VAGRANT_HTTPS_PROXY=$HTTP_PROXY
            export VAGRANT_FTP_PROXY=$HTTP_PROXY
            export VAGRANT_NO_PROXY=$HTTP_PROXY

            ;;

          pitc)
              # Swap in the temp values
              echo "Enabling proxy..."
              export HTTP_PROXY="http://pitc-cin.cloud.health.ge.com:80"
              export http_proxy=$HTTP_PROXY
              export HTTPS_PROXY=$HTTP_PROXY
              export https_proxy=$HTTP_PROXY
              export NO_PROXY=$NO_PROXY_TEMP
              export no_proxy=$NO_PROXY_TEMP
              export VAGRANT_HTTP_PROXY=$HTTP_PROXY
              export VAGRANT_HTTPS_PROXY=$HTTP_PROXY
              export VAGRANT_FTP_PROXY=$HTTP_PROXY
              export VAGRANT_NO_PROXY=$HTTP_PROXY

              ;;

          health)
              # Swap in the temp values
              echo "Enabling proxy..."
              export HTTP_PROXY="http://http-proxy.ha.health.ge.com:88"
              export http_proxy=$HTTP_PROXY
              export HTTPS_PROXY=$HTTP_PROXY
              export https_proxy=$HTTP_PROXY
              export NO_PROXY=$NO_PROXY_TEMP
              export no_proxy=$NO_PROXY_TEMP
              export VAGRANT_HTTP_PROXY=$HTTP_PROXY
              export VAGRANT_HTTPS_PROXY=$HTTP_PROXY
              export VAGRANT_FTP_PROXY=$HTTP_PROXY
              export VAGRANT_NO_PROXY=$HTTP_PROXY

              ;;



        *)
            # Note: I use $BASH_SOURCE instead of $0 because I'm in a sourced script
            #       Also, the funky '##*/' is used to grab the field after the last slash,
            #       because $BASH_SOURCE returns the path, which I trim off for neatness.
            echo $"Usage: ${BASH_SOURCE##*/} {on|off}"
            return 0
esac
