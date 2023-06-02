#~/bin/bash
# pull the braincloud-cpp repo to braincloud-cpp/ folder
# checkout to the branch you'd like to test

set -e

if [ "${1}" == "OFF" ]
then
    export CPPSOURCE="" # This will restore Podfile to default fetch remote pod
    export JSONSOURCE=""
else
    export CPPSOURCE="braincloud-cpp" # This will prevent from fetch remote pod, and use local clone instead for cpp
    export JSONSOURCE="braincloud-cpp/lib/jsoncpp-1.0.0" 

    #Need to get into the folder where the pod is
    pod deintegrate
    pod install --repo-update
fi

pod update
