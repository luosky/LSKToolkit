Pod::Spec.new do |s|
  s.name     = 'LSKToolkit'
  s.version  = '1.0.131122'
  s.license  = 'MIT'
  s.summary  = 'A short description of LSKToolkit.'
  s.homepage = 'https://github.com/luosky/LSKToolkit'
  s.author   = { 'Luosky' => 'luosky@gmail.com' }
  s.source   = { 
    :git => 'https://github.com/luosky/LSKToolkit.git', 
    :commit => '6db715703111377224477a128655232e34ba2254'
  }

  s.description = 'An optional longer description of LSKToolkit.'
  s.platform = :ios

  s.source_files = 'LSKToolkit/**/*.{h,m}'
  s.resources = "LSKToolkit/Resources/**/*.png", "LSKToolkit/**/*.xib"

  s.requires_arc = true
  s.frameworks = 'MessageUI','MapKit','CoreLocation'
  # s.dependency 'EGOImageLoading'
  s.dependency 'SVProgressHUD',       '0.6'
  s.dependency 'MBProgressHUD',       '~> 0.8'

end
