#
# Be sure to run `pod spec lint LSKToolkit.podspec' to ensure this is a
# valid spec.
#
# Remove all comments before submitting the spec.
#
Pod::Spec.new do |s|
  s.name     = 'LSKToolkit'
  s.version  = '1.0.0'
  s.license  = 'MIT'
  s.summary  = 'A short description of LSKToolkit.'
  s.homepage = 'https://github.com/luosky/LSKToolkit'
  s.author   = { 'Luosky' => 'luosky@gmail.com' }
  s.source   = { :git => 'https://github.com/luosky/LSKToolkit.git', :commit => '2ce1cbcf5f065b5b4df4ff8129aa5c1144df9c24' }

  s.description = 'An optional longer description of LSKToolkit.'
  s.platform = :ios

  s.source_files = 'LSKToolkit/**/*.{h,m}'
  s.resources = "LSKToolkit/Resources/*.png"
  s.framework = 'MessageUI'
  s.requires_arc = true

  s.dependency 'EGOImageLoading'
  s.dependency 'SVProgressHUD',       '~> 0.6'
  s.dependency 'MBProgressHUD',       '~> 0.5'


  # A list of paths to remove after installing the Pod without the
  # `--no-clean' option. These can be examples, docs, and any other type
  # of files that are not needed to build the Pod.
  #
  # *NOTE*: Never remove license and README files.
  #
  # Also allows the use of the FileList class like `source_files does.
  #
  # s.clean_path = "examples"
  # s.clean_paths = "examples", "doc"

  # Specify a list of frameworks that the application needs to link
  # against for this Pod to work.
  #
  # s.framework = 'SomeFramework'
  # s.frameworks = 'SomeFramework', 'AnotherFramework'


  # Specify a list of libraries that the application needs to link
  # against for this Pod to work.
  #
  # s.library = 'iconv'
  # s.libraries = 'iconv', 'xml2'


  # If you need to specify any other build settings, add them to the
  # xcconfig hash.
  #
  # s.xcconfig = { 'HEADER_SEARCH_PATHS' => '$(SDKROOT)/usr/include/libxml2' }

end
