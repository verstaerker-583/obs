#!/bin/bash

declare -xr AWK_CMD="/usr/bin/awk"
declare -xr SW_VERS_CMD="/usr/bin/sw_vers"
declare -xr DSIMPORT_CMD="/usr/bin/dsimport"
declare -xr ID_CMD="/usr/bin/id"

USERNAME="$1"; export USERNAME
USERPIC="$2"; export USERPIC

OSVERSION=$(${SW_VERS_CMD} -productVersion | ${AWK_CMD} -F"." '{print $2;exit}'); export OSVERSION
# Add the LDAP picture to the user record if dsimport is avaiable 10.6+
if [ -f "${USERPIC}" ] ; then
    # On 10.6 and higher this works
    if [ "${OSVERSION}" -ge "6" ] ; then
        declare -x MAPPINGS='0x0A 0x5C 0x3A 0x2C'
        declare -x ATTRS='dsRecTypeStandard:Users 2 dsAttrTypeStandard:RecordName externalbinary:dsAttrTypeStandard:JPEGPhoto'
        declare -x PICIMPORT="/Library/Caches/${USERNAME}.picture.dsimport"
        printf "%s %s \n%s:%s" "${MAPPINGS}" "${ATTRS}" "${USERNAME}" "${USERPIC}" >"${PICIMPORT}"
        # Check to see if the username is correct and import picture
        if ${ID_CMD} "${USERNAME}" &>/dev/null ; then
            # No credentials passed as we are running as root
            ${DSIMPORT_CMD} "${PICIMPORT}" /Local/Default M &&
                echo "Successfully imported users picture."
        fi
    fi
fi