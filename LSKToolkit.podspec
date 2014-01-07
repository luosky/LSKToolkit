Pod::Spec.new do |s|
  s.name     = 'LSKToolkit'
  s.version  = '1.0.2'
  s.license  = 'MIT'
  s.summary  = 'A short description of LSKToolkit.'
  s.homepage = 'https://github.com/luosky/LSKToolkit'
  s.author   = { 'Luosky' => 'luosky@gmail.com' }
  s.source   = { 
    :git => 'https://github.com/luosky/LSKToolkit.git', 
    :tag => '1.0.2'
  }

  s.description = 'An optional longer description of LSKToolkit.'
  s.platform = :ios
  s.ios.deployment_target = '5.0'

  s.source_files = 'LSKToolkit/**/*.{h,m}'
  s.resources = "LSKToolkit/Resources/**/*.png", "LSKToolkit/**/*.xib"

  s.requires_arc = true
  s.frameworks = 'MessageUI','MapKit','CoreLocation'
  s.dependency 'SVProgressHUD',       '0.6'
  s.dependency 'MBProgressHUD',       '~> 0.8'
  s.dependency 'MKNetworkKit',         '0.87'
end
