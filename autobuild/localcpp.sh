#~/bin/bash
# pull the braincloud-cpp repo to braincloud-cpp/ folder
# checkout to the branch you'd like to test

set -e

if [ "${1}" == "OFF" ]
then
    export CPPSOURCE=""
else
    export CPPSOURCE="JENKINS" # This will prevent from fetch remote pod, and use local clone instead for cpp

    #Need to get into the folder where the pod is
    pod deintegrate
    pod install --repo-update
fi

pod update
