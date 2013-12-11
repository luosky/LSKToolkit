Pod::Spec.new do |s|
  s.name         = "NGTabBarController"
  s.version      = "0.1.121223"
  s.summary      = "A custom TabBarController implementation for iPhone and iPad."
  s.description  = 'A custom TabBarController which can be positioned on the bottom, top, left or top. ' \
                   'Utilizes iOS 5 Containment API if possible, but works on iOS 4 too. '                \
                   'The TabBar is fully customizable with a tintColor or background image as well as '   \
                   'the possibility to show/hide the item highlight and the possibility to change the '  \
                   'text colors, have image-only tabBar items etc.'
  s.homepage     = "https://github.com/luosky/NGTabBarController"
  s.author       = { "NOUSguide Inc. / NOUS Wissensmanagement GmbH" => "info@nousguide.com" }
  s.source       = { :git => "https://github.com/luosky/NGTabBarController.git",
                     :commit => '672cca0db0c81f40e6a9a541492d71802ec95c5f' }
  s.license      = 'MIT'
  s.platform     = :ios
  s.source_files = 'NGTabBarController'

  s.requires_arc = true
end
