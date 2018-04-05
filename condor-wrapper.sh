#!/bin/bash

# Clean up after ourselves
trap "{ /usr/sbin/condor_off -master; exit 0; }" TERM

# Copy the IP address of the HOST to condor_config file and boot up HTCondor
echo "TCP_FORWARDING_HOST = $HOST_IP"  >> /etc/condor/condor_config
/usr/sbin/condor_master -f &
