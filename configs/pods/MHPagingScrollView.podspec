Pod::Spec.new do |s|
  s.name = 'MHPagingScrollView'
  s.version = '0.0.1.130718'
  s.summary = 'A UIScrollView subclass that shows previews of the pages on the left and right. '
  s.homepage = 'https://github.com/hollance/MHPagingScrollView'
  s.license = 'MIT'
  s.author = 'hollance'
  s.source = {
    :git => 'https://github.com/hollance/MHPagingScrollView.git',
    :commit => '4ee60acbf321a8bde1b9b85c846f7ab9622fb565'
  }
  s.platform = :ios, '5.0'
  s.source_files = 'MHPagingScrollView'

  s.requires_arc = true
end