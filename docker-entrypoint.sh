#!/bin/bash
set -e

# update default values of PAM environment variables (used by CRON scripts)
env | while read -r LINE; do  # read STDIN by line
    # split LINE by "=" (see IFS)
    IFS="=" read VAR VAL <<< ${LINE}
    # remove existing definition of environment variable, ignoring exit code
    sed --in-place "/^${VAR}/d" /etc/security/pam_env.conf || true
    # append new default value of environment variable
    echo "${VAR} DEFAULT=${VAL}" >> /etc/security/pam_env.conf
done

exec "$@"
