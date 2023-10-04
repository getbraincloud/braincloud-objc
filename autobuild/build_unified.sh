#!/bin/bash

artifacts_dir=artifacts
archives_dir=archives
build_dir=build
#temporary to switch to the beta xcode
#export DEVELOPER_DIR=/Applications/Xcode-beta.app/Contents/Developer

build_config=Release

library_os="Apple_ObjC"

sim_archs="-arch arm64 -arch x86_64"
#verbose=-verbose

build_version="$1"
if [ "$build_version" == "" ]
then
    build_version=$(cat BrainCloud.podspec | grep "s.version  =" | grep -o '".*"' | tr -d '"')
    if [ "$build_version" == "" ]
    then  echo "build_unified.sh <build_version>"
          echo ""
          echo "Must set build_version via 4 digit number"
          echo " ie \"1.6.0.1234\""
          exit 1
    fi
fi

build_internal_version=`echo $build_version | cut -d "." -f 4`
build_external_version=`echo $build_version | cut -d "." -f 1-3`


function failed()
{
    local error=${1:-Undefined error}
    echo "Failed: $error" >&2
    exit 1
}

function build_app()
{
  local devired_data_path="$HOME/Library/Developer/Xcode/DerivedData"

  #get the name of the workspace to be build, used as the prefix of the DerivedData directory for this build
  #local workspace_name=$(echo "$workspace" | sed -n 's/\([^\.]\{1,\}\)\.xcworkspace/\1/p')
  #build the app
  echo "Running xcodebuild > xcodebuild_output ..."

  rm -rf BrainCloud.xcframework

  xcodebuild archive -workspace BrainCloud.xcworkspace -scheme BrainCloud-iOS -destination "generic/platform=iOS" -configuration $build_config -archivePath "archives/BrainCloud-iOS"
  if [ $? -ne 0 ]
  then
    failed "xcodebuild iOS"
  else
      echo  "Success! xcodebuild iOS"
    fi
  xcodebuild archive -workspace BrainCloud.xcworkspace -scheme BrainCloud-iOS -destination "generic/platform=iOS Simulator" -configuration $build_config -archivePath "archives/BrainCloud-iOS_Simulator"
  if [ $? -ne 0 ]
  then
    failed "xcodebuild iOS Simulator"
  else
      echo  "Success! xcodebuild iOS Simulator"
    fi

#  xcodebuild archive -workspace BrainCloud.xcworkspace -scheme BrainCloud-OSX  -destination "generic/platform=macOS"  -configuration $build_config -derivedDataPath ./build/osx -archivePath "archives/BrainCloud-OSX"
#  if [ $? -ne 0 ]
#  then
#    failed "xcodebuild OSX"
#  else
#      echo  "Success! xcodebuild OSX"
#  fi

# not available at this time
#  xcodebuild archive -workspace BrainCloud.xcworkspace -configuration "$build_config" -scheme BrainCloud-OSX  -destination "generic/platform=macOS,variant=Mac Catalyst" -archivePath "archives/BrainCloud-Mac_Catalyst"
#  if [ $? -ne 0 ]
#  then
#    failed "xcodebuild Mac Catalyst"
#  fi

#  xcodebuild archive -workspace BrainCloud.xcworkspace -configuration "$build_config" -scheme BrainCloud-tvOS -destination "generic/platform=tvOS" -archivePath "archives/BrainCloud-tvOS"
#  if [ $? -ne 0 ]
#  then
#    failed "xcodebuild tvOS"
#  else
#    echo  "Success! xcodebuild tvOS"
#  fi
#  xcodebuild archive -workspace BrainCloud.xcworkspace -configuration "$build_config" -scheme BrainCloud-tvOS -destination "generic/platform=tvOS Simulator" -archivePath "archives/BrainCloud-tvOS_Simulator"
#  if [ $? -ne 0 ]
#  then
#    failed "xcodebuild tvOS Simulator"
#  else
#    echo  "Success! xcodebuild tvOS Simulator"
#  fi
#
#  xcodebuild archive -workspace BrainCloud.xcworkspace -configuration "$build_config" -scheme BrainCloud-watchOS -destination "generic/platform=watchOS" -archivePath "archives/BrainCloud-watchOS"
#  if [ $? -ne 0 ]
#  then
#    failed "xcodebuild watchOS"
#  else
#    echo  "Success! xcodebuild watchOS"
#  fi
#  xcodebuild archive -workspace BrainCloud.xcworkspace -configuration "$build_config" -scheme BrainCloud-watchOS -destination "generic/platform=watchOS Simulator" -archivePath "archives/BrainCloud-watchOS_Simulator"
#  if [ $? -ne 0 ]
#  then
#    failed "xcodebuild watchOS Simulator"
#  else
#    echo  "Success! xcodebuild  watchOS Simulator"
#  fi

  # -archive archives/BrainCloud-OSX.xcarchive -framework BrainCloud.framework \
  # -archive archives/BrainCloud-tvOS.xcarchive -framework BrainCloud.framework \
  # -archive archives/BrainCloud-tvOS_Simulator.xcarchive -framework BrainCloud.framework \
  # -archive archives/BrainCloud-watchOS.xcarchive -framework BrainCloud.framework \
  # -archive archives/BrainCloud-watchOS_Simulator.xcarchive -framework BrainCloud.framework \
  xcodebuild -create-xcframework \
    -archive archives/BrainCloud-iOS.xcarchive -framework BrainCloud.framework \
    -archive archives/BrainCloud-iOS_Simulator.xcarchive -framework BrainCloud.framework \
    -output brainCloud/BrainCloud.xcframework
  if [ $? -ne 0 ]
  then
    failed "xcodebuild create framework"
  else
    echo  "Success! xcodebuild  create framework"
  fi

  cp autobuild/docs/README.md brainCloud/README.md
  pushd brainCloud
  sed -i xxx "s/Platform: xxx/Platform: Apple C++/g" README.md
  sed -i xxx "s/Version: x.x.x/Version: ${build_version}/g" README.md
  popd

  zip -r $artifacts_dir/brainCloudClient_${library_os}_${build_version}.zip brainCloud

  #rm -rf BrainCloud.xcframework
}

function clean_artifacts
{
  rm -rf $artifacts_dir
  mkdir $artifacts_dir
  rm -rf $archives_dir
  mkdir $archives_dir
  rm -rf $build_dir
  mkdir $build_dir
}

# turn on shell command logging
set -x

# turn on exit on fail 
#set -e

# turn on fail if something in pipeline fails
#set -o pipefail

echo "**** Clean artifacts"
clean_artifacts
echo
echo "**** Build"
build_app
echo
echo "**** Complete!"

