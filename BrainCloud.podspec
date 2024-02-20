#
#  BrainCloud.podspec
#  BrainCloud
#
#  Copyright (c) 2017 BitHeads Inc. All rights reserved.
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name     = "BrainCloud"

  s.version  = "5.2.0"

  s.summary  = "The Objective-C/Swift client library for brainCloud"
  s.homepage = "http://getbraincloud.com/"

  s.ios.deployment_target  = "12.0"
  s.osx.deployment_target  = "10.13"
  s.tvos.deployment_target = "12.0"
  s.watchos.deployment_target = "4.0"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license                = {:type => "Apache License, Version 2.0", :file => "LICENSE"}

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.authors                = {"brainCloud Team" => "support@getbraincloud.com"}

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source                 = {:git => "https://github.com/getbraincloud/braincloud-objc.git", :tag => s.version}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.header_mappings_dir    = 'Shared'
  s.public_header_files    = 'Shared/**/*.{h,hh}'
  s.private_header_files   = 'Shared/**/{BrainCloudCallback,TypeHelpers,BrainCloudRTTCallback,BrainCloudRTTConnectCallback,BrainCloudRelayCallback,BrainCloudRelaySystemCallback,BrainCloudRelayConnectCallback}.hh'
  s.source_files           = 'Shared/**/*.{h,hh,m,mm}'

  # for use_frameworks!
  # to use development pod: change below to your full source code path
  # to use cocoapod release: change to be relative to ${PODS_ROOT}
  s.xcconfig = {
    # eg. '"${PODS_ROOT}/BrainCloudCpp/include"', '"/local/path/to/braincloud-cpp/include"'
    'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/BrainCloudCpp/include"'
  }
  
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.libraries                = 'c++', 'z'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.dependency 'BrainCloudCpp', '5.1.0'

end
