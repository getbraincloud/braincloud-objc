#
#  BrainCloud.podspec
#  BrainCloud
#
#  Copyright (c) 2017 BitHeads Inc. All rights reserved.
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name     = "BrainCloud"

  s.version  = "4.4.1"

  s.summary  = "The Objective-C/Swift client library for brainCloud"
  s.homepage = "http://getbraincloud.com/"

  s.ios.deployment_target  = "7.0"
  s.osx.deployment_target  = "10.9"
  s.tvos.deployment_target = "9.0"

  # ―――  Spec License  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.license                = {:type => "Apache License, Version 2.0", :file => "LICENSE"}

  # ――― Author Metadata  ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.authors                = {"brainCloud Team" => "support@getbraincloud.com"}
  s.social_media_url       = "https://twitter.com/braincloudbaas"

  # ――― Source Location ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.source                 = {:git => "https://github.com/getbraincloud/braincloud-objc.git", :tag => s.version}

  # ――― Source Code ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.header_mappings_dir    = 'Shared'
  s.public_header_files    = 'Shared/**/*.{h,hh}'
  s.private_header_files   = 'Shared/**/{BrainCloudCallback,TypeHelpers,BrainCloudRTTCallback,BrainCloudRTTConnectCallback}.hh'
  s.source_files           = 'Shared/**/*.{h,hh,m,mm}'


  # hack for use_frameworks!
  # hack for use_frameworks!
  s.xcconfig = {
    'USER_HEADER_SEARCH_PATHS' => '"${PODS_ROOT}/BrainCloudCpp/include"'
  }

  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.libraries                = 'c++', 'z'

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.dependency 'BrainCloudCpp', '4.4.1'

end
