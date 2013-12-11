Pod::Spec.new do |s|
  s.name     = 'UIDevice-with-UniqueIdentifier-for-iOS-5'
  s.version  = '0.0.1.120720'
  s.license  = 'MIT'
  s.summary  = 'Apple stopped supporting a unique identifier for iOS. This source code solves the problem. It generates a unique identifier based on the mac address of the device in combination with the bundle identifier.'
  s.homepage = 'https://github.com/gekitz/UIDevice-with-UniqueIdentifier-for-iOS-5'
  s.author   = 'Georg Kitz'
  s.source   = { 
    :git => 'https://github.com/gekitz/UIDevice-with-UniqueIdentifier-for-iOS-5.git', 
    :commit => '93017323ee0dd4f0c0e52efa7773def2b9da4fe3' 
  }
  s.platform = :ios
  s.source_files = 'Classes/*.{h,m}'
#  s.clean_paths = "UIDeviceAddition", "UIDeviceAddition.xcodeproj"
  s.requires_arc = false

end
