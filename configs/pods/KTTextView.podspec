Pod::Spec.new do |s|
  s.name     = 'KTTextView'
  s.version  = '0.0.1.121114'
  s.platform = :ios
  s.license  = 'MIT'
  s.source   = { :git    => 'https://github.com/Dal-Papa/KTTextView.git',
                 :commit => '82ac18d3bcc7a6fe341acdd284b8e4dbf4a0c5b7' }
  s.source_files = 'Classes/KTTextView.{h,m}'
  s.requires_arc = false
end
