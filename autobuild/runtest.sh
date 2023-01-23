#!/bin/bash

for var in "$@"
do
	COMMAND="$COMMAND -only-testing:BrainCloud-iOSTests/Test$var"
done

xcodebuild test -workspace BrainCloud.xcworkspace -destination "platform=iOS Simulator,name=iPhone 8 Plus" -scheme BrainCloud-iOS  ${COMMAND}
