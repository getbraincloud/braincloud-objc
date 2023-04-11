#
#  Podfile
#  BrainCloud
#
#  Copyright (c) 2020 BitHeads Inc. All rights reserved.
#

inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

def shared_pods
  if ENV['CPPSOURCE'] == "JENKINS" then
    pod 'BrainCloudCpp', :path => './braincloud-cpp/'
  elsif ENV['CPPSOURCE'] == "HOME" then
    pod 'BrainCloudCpp', :path => '~/git/braincloud-cpp/'
  else
    pod 'BrainCloudCpp', '4.14.1'
  end
end

target 'BrainCloud-iOS' do
  platform :ios, '11.0'
  shared_pods
end

target 'BrainCloud-iOSTests' do
  platform :ios, '11.0'
  shared_pods
end

target 'BrainCloud-OSX' do
  platform :osx, '10.13'
  shared_pods
end

target 'BrainCloud-OSXTests' do
  platform :osx, '10.13'
  shared_pods
end

target 'BrainCloud-tvOS' do
  platform :tvos, '11.0'
  shared_pods
end

target 'BrainCloud-tvOSTests' do
  platform :tvos, '11.0'
  shared_pods
end

target 'BrainCloud-watchOS' do
  platform :watchos, '4.0'
  shared_pods
end

target 'BrainCloud-watchOSTests' do
  platform :watchos, '4.0'
  shared_pods
end

post_install do |installer|
    installer.generated_projects.each do |project|
          project.targets.each do |target|
              target.build_configurations.each do |config|
                config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
                config.build_settings.delete 'WATCHOS_DEPLOYMENT_TARGET'
                config.build_settings.delete 'TVOS_DEPLOYMENT_TARGET'
                config.build_settings.delete 'MACOSX_DEPLOYMENT_TARGET'
               end
          end
   end
end
