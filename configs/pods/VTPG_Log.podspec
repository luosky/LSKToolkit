Pod::Spec.new do |s|
  s.name     = 'VTPG_Log'
  s.version  = '0.0.1.120719'
  s.platform = :ios
  s.license  = 'MIT'
  s.homepage = 'http://vgable.com/blog/2010/08/19/'
  s.author   = 'Mathieu Godart, Vincent Gable'
  s.source   = { :git    => 'https://github.com/luosky/LOG_EXPR.git',
                 :commit => '04db32148f3e7dd807149b2e9df3b71d57d6c148' }

  s.source_files = 'VTPG_LogExpr.{h,m}'
end
