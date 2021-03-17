#
#  Podfile
#  BrainCloud
#
#  Copyright (c) 2020 BitHeads Inc. All rights reserved.
#

inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

def shared_pods
  pod 'BrainCloudCpp', '4.7.0'
  # pod 'BrainCloudCpp', :path => '~/git/braincloud-cpp/'
end

target 'BrainCloud-iOS' do
  platform :ios, '9.0'
  shared_pods
end

target 'BrainCloud-iOSTests' do
  platform :ios, '9.0'
  shared_pods
end

target 'BrainCloud-OSX' do
  platform :osx, '10.9'
  shared_pods
end

target 'BrainCloud-OSXTests' do
  platform :osx, '10.9'
  shared_pods
end

target 'BrainCloud-tvOS' do
  platform :tvos, '9.0'
  shared_pods
end

target 'BrainCloud-tvOSTests' do
  platform :tvos, '9.0'
  shared_pods
end
