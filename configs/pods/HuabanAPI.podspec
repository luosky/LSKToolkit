Pod::Spec.new do |s|
  s.name     = 'HuabanAPI'
  s.version  = '0.0.1.130508002'
  s.platform = :ios
  # s.license  = 'MIT'
  s.summary  = ''
  s.homepage = ''
  s.source   = { :git => 'git@git.rj8g.com:ios/huabanapi.git',
                 :commit => '6a922962c9a6f76d033da76001042160ad62a263' }

  s.description = ''

  # s.frameworks   = 'QuartzCore'
  s.source_files = 'HuabanAPI/*.{h,m}','HuabanAPI/**/*.{h,m}'
  s.requires_arc = false
end
