#!/bin/sh

# Scenarios File Path
SCENARIO_FILE=/home/ec2-user/chandresh/SIPP/

# SIPP Path 
SFT_EXE=/home/ec2-user/SIPP/sipp-3.5.1/sipp


# Remote serveraddress
Server_IP=$5

LOCAL_PORT=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`
LOCAL_CONTROL_PORT=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`
LOCAL_MEDIA_PORT=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`

FULL_PATH1=$SCENARIO_FILE$1

##########with sipp log############

if [ "$1" != "" ] && [ "$2" != "" ] && [ "$3" != "" ] && [ "$4" != "" ] && [ "$5" != "" ] ; then
    sudo $SFT_EXE -sf $FULL_PATH1 -p $LOCAL_PORT -mp $LOCAL_MEDIA_PORT -cp $LOCAL_CONTROL_PORT $Server_IP -key FROM $2 -key TO $3 -key domain $4  -key User-Agent $5 -aa  -m 1 -trace_msg -trace_err
else
    echo "Usage:./uac_number.shInvite_xml_filename"
    exit 1
fi


########################################## ---------- SAMPLE Command ----------- #################################################

####    ./UAC.sh UAC.xml from to test.com useragent
