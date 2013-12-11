Pod::Spec.new do |s|
  s.name     = 'MKNumberBadgeView'
  s.version  = '0.0.1.120329'
  s.platform = :ios
  s.summary  = 'A configurable view that draws a number badge similar to the ones the iPhone OS can draw on app icons and tab bar items'
  s.homepage = 'https://github.com/michaelkamprath/iPhoneMK'
  s.author   = { 'Michael Kamprath' => 'michael@claireware.com' }
  s.source   = { :git => 'https://github.com/michaelkamprath/iPhoneMK.git', :commit =>  '19f4c11eae2bd8e142b2843272316384b885edf6' }


  s.source_files = 'Views/MKNumberBadgeView/MKNumberBadgeView.{h,m}'
  #s.clean_paths = 'Views/MKNetworkImageView','Views/MKSound*','Sample App','TableViewCells'
end
