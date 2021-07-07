#!/bin/sh
# Scenarios File Path
SCENARIO_FILE=/home/ec2-user/chandresh/SIPP/

# SIPP Path 
SFT_EXE=/home/ec2-user/SIPP/sipp-3.5.1/sipp

# Remote serveraddress
Server_IP=$5

# Auto Generate System Port
LOCAL_PORT=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`
LOCAL_CONTROL_PORT=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`


FULL_PATH=$SCENARIO_FILE$1
FULL_PATH2=$SCENARIO_FILE$2

##########with sipp log############
if [ "$1" != "" ] && [ "$2" != "" ] && [ "$3" != "" ]  && [ "$4" != "" ] && [ "$5" != "" ] ; then
    sudo $SFT_EXE -sf $FULL_PATH -p $LOCAL_PORT -cp $LOCAL_CONTROL_PORT $5 -m 1 -aa -key username  $3 -key useragent $4 -key domain $5 -trace_msg -trace_err
    if test $? -eq 0
        then
                echo Test $i failed
                LOCAL_MEDIA_PORT=`python -c 'import socket; s=socket.socket(); s.bind(("", 0)); print(s.getsockname()[1]); s.close()'`
                sudo $SFT_EXE -sf $FULL_PATH2 -p $LOCAL_PORT -mp $LOCAL_MEDIA_PORT -cp $LOCAL_CONTROL_PORT $5   -aa  -timeout 300s -trace_msg -trace_err
        else
                exit 1
    fi
else
    echo "Usage:./uas_number.sh register_xml_filename Invite_xml_filename"
    exit 1
fi

########################################## ---------- SAMPLE Command ----------- #################################################

#### ./UAS.sh Registration.xml UAS.xml  username  useragent test.com

