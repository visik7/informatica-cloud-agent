#!/bin/sh

if [ ! $# -eq 2 ] ; then
    echo "No username password provided"
    echo "please provide username and password"
    exit 10
fi

set -e
cd /root/infaagent
./agent_start.sh  &

sleep 3

/root/infaagent/main/agentcore/consoleAgentManager.sh configure $1 $2 | grep -q fails && exit 2


wait
