#
#  Podfile
#  BrainCloud
#
#  Copyright (c) 2026 BitHeads Inc. All rights reserved.
#

inhibit_all_warnings!
source 'https://github.com/CocoaPods/Specs.git'

def shared_pods
  if ENV['CPPSOURCE'].to_s.empty?
        pod 'BrainCloudCpp'
        pod 'BrainCloudJsonCpp'
    else
        pod 'BrainCloudCpp', :path => ENV['CPPSOURCE'] 
        pod 'BrainCloudJsonCpp', :path => ENV['JSONSOURCE'] 
  end
end

target 'BrainCloud-iOS' do
  platform :ios, '15.0'
  shared_pods
  target 'BrainCloud-iOSTests' do
    inherit! :search_paths
  end
end

target 'BrainCloud-OSX' do
  platform :osx, '13.0'
  shared_pods
  target 'BrainCloud-OSXTests' do
    inherit! :search_paths
  end
end

target 'BrainCloud-tvOS' do
  platform :tvos, '15.0'
  shared_pods
  target 'BrainCloud-tvOSTests' do
    inherit! :search_paths
  end
end

target 'BrainCloud-visionOS' do
  platform :visionos, '1.0'
  shared_pods
  target 'BrainCloud-visionOSTests' do
    inherit! :search_paths
  end
end

target 'BrainCloud-watchOS' do
  platform :watchos, '8.0'
  shared_pods
  target 'BrainCloud-watchOSTests' do
    inherit! :search_paths
  end
end

post_install do |installer|
  minimums = {
    'IPHONEOS_DEPLOYMENT_TARGET' => '15.0',
    'MACOSX_DEPLOYMENT_TARGET'   => '13.0',
    'TVOS_DEPLOYMENT_TARGET'     => '15.0',
    'XROS_DEPLOYMENT_TARGET'     => '1.0',
    'WATCHOS_DEPLOYMENT_TARGET'  => '8.0',
  }
  installer.generated_projects.each do |project|
    project.targets.each do |target|
      target.build_configurations.each do |config|
        minimums.each do |key, min_version|
          current = config.build_settings[key].to_s
          if current.empty? || !Gem::Version.correct?(current) || Gem::Version.new(min_version) > Gem::Version.new(current)
            config.build_settings[key] = min_version
          end
        end
      end
    end
  end
end
