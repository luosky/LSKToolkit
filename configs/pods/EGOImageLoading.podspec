Pod::Spec.new do |s|
  s.name     = 'EGOImageLoading'
  s.version  = '0.0.1.13010701'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'What if images on the iPhone were as easy as HTML?'
  s.homepage = 'https://github.com/enormego/EGOImageLoading'
  s.author   = 'Shaun Harrison'
  s.source   = { :git    => 'https://github.com/luosky/EGOImageLoading.git',
                 :commit => '8f5027789321f5511fa61779615587158386c9ac' }

  s.source_files = 'EGO*/*.{h,m}'
  s.dependency 'EGOCache',       '0.1.0'
end