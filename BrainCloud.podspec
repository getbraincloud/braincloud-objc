#
#  BrainCloud.podspec
#  BrainCloud
#
#  Copyright (c) 2017 BitHeads Inc. All rights reserved.
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  s.name     = "BrainCloud"

  s.version  = "6.0.1"

  s.summary  = "The Objective-C/Swift client library for brainCloud."
  s.homepage = "http://getbraincloud.com/"

  s.ios.deployment_target      = "15.0"
  s.osx.deployment_target      = "13.0"
  s.tvos.deployment_target     = "15.0"
  s.visionos.deployment_target = "1.0"
  s.watchos.deployment_target  = "8.0"

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

  # Shared/*.mm #include "braincloud/*.h" from the BrainCloudCpp pod. Published pods live
  # under ${PODS_ROOT}; a local :path dev pod stays in its working tree, so also add
  # CPPSOURCE when set (bccm syncsdk exports it for -e internal only; unset for prod).
  cpp_header_search = '"${PODS_ROOT}/BrainCloudCpp/include" "${PODS_ROOT}/BrainCloudCpp/include/braincloud/internal/apple"'
  cpp_dev_source = ENV['CPPSOURCE'].to_s
  unless cpp_dev_source.empty?
    cpp_header_search += " \"#{cpp_dev_source}/include\" \"#{cpp_dev_source}/include/braincloud/internal/apple\""
  end
  s.xcconfig = { 'USER_HEADER_SEARCH_PATHS' => cpp_header_search }
  
  # ――― Project Linking ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #

  #s.libraries                = 'c++', 'z' # BrainCloudCpp.podspec already link these libraries

  # ――― Project Settings ――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  s.dependency 'BrainCloudCpp', '6.0.1'

end
