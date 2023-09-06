#
#  Podfile
#  BrainCloud
#
#  Copyright (c) 2020 BitHeads Inc. All rights reserved.
#

inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

def shared_pods
  if ENV['CPPSOURCE'] == "" then
        pod 'BrainCloudCpp'
        pod 'BrainCloudJsonCpp'
    else
        pod 'BrainCloudCpp', :path => ENV['CPPSOURCE'] 
        pod 'BrainCloudJsonCpp', :path => ENV['JSONSOURCE'] 
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
               if Gem::Version.new('11.0') > Gem::Version.new(config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'])
                 config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
               end
               if Gem::Version.new('4.0') > Gem::Version.new(config.build_settings['WATCHOS_DEPLOYMENT_TARGET'])
                 config.build_settings['WATCHOS_DEPLOYMENT_TARGET'] = '4.0'
               end
               if Gem::Version.new('11.0') > Gem::Version.new(config.build_settings['TVOS_DEPLOYMENT_TARGET'])
                 config.build_settings['TVOS_DEPLOYMENT_TARGET'] = '11.0'
               end
               if Gem::Version.new('10.13') > Gem::Version.new(config.build_settings['MACOSX_DEPLOYMENT_TARGET'])
                 config.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.13'
               end
             end
         end
 end
end
