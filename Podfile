platform :ios, :deployment_target=>'5.0'

dependency 'SVProgressHUD', 	    '~> 0.6'
dependency 'MBProgressHUD',       '~> 0.5'
pod 'MKNetworkKit'        ,       '0.85.1'

dependency do |s|
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

dependency do |s|
  s.name     = 'EGOImageLoading'
  s.version  = '0.0.1.120329'
  s.platform = :ios
  s.license  = 'MIT'
  s.summary  = 'What if images on the iPhone were as easy as HTML?'
  s.homepage = 'https://github.com/enormego/EGOImageLoading'
  s.author   = 'Shaun Harrison'
  s.source   = { :git    => 'git://github.com/enormego/EGOImageLoading.git',
                 :commit => '4f4e6a626ef518d59dd38f5e69b835365f5a4830' }

  s.source_files = 'EGO*/*.{h,m}'
  s.clean_paths  = 'Demo'
  s.dependency 'EGOCache'
end

dependency do |s|
  s.name     = 'MKNumberBadgeView'
  s.version  = '0.0.1.120329'
  s.platform = :ios
  s.summary  = 'A configurable view that draws a number badge similar to the ones the iPhone OS can draw on app icons and tab bar items'
  s.homepage = 'https://github.com/michaelkamprath/iPhoneMK'
  s.author   = { 'Michael Kamprath' => 'michael@claireware.com' }
  s.source   = { :git => 'https://github.com/michaelkamprath/iPhoneMK.git', :commit =>  '19f4c11eae2bd8e142b2843272316384b885edf6' }


  s.source_files = 'Views/MKNumberBadgeView/MKNumberBadgeView.{h,m}'
  s.clean_paths = 'Views/MKNetworkImageView','Views/MKSound*','Sample App','TableViewCells'
end


# dependency do |s|
#   s.name     = 'MKNetworkKit'
#   s.version  = '0.83.120720'
#   s.license  = 'MIT'
#   s.summary  = 'Full ARC based Networking Kit for iOS 4+ devices'
#   s.homepage = 'https://github.com/MugunthKumar/MKNetworkKit'
#   s.author   = { 'MugunthKumar' => 'mknetworkkit@mk.sg' }
#   s.source   = { :git => 'https://github.com/MugunthKumar/MKNetworkKit.git', :commit => '3ace8141eb8d050ce335e253859ddd194c2e8af8' }

#   files = FileList['MKNetworkKit/*.{h,m}', 'MKNetworkKit/Categories/*.{h,m}']
#   # if config.ios?
#     files.exclude(/NSAlert/)
#     s.frameworks = 'CFNetwork', 'Security'
#   # else
#   #   files.exclude(/UIAlertView/)
#   #   s.frameworks = 'CoreServices', 'Security'
#   # end
#   s.source_files = files
#   s.clean_paths  = 'MKNetworkKit-*', '*-Demo', 'SampleImage.jpg'
#   s.requires_arc = true

#   s.dependency 'Reachability', '~> 3.0'

#   def s.post_install(target)
#     # Fix an import statement which is used inconsistently in MKNetworkKit
#     # TODO create a ticket for this upstream
#     header = (pod_destroot + 'MKNetworkKit/MKNetworkKit.h')
#     header_contents = header.read.sub('Reachability/Reachability.h', 'Reachability.h')
#     header.open('w') do |file|
#      file.puts(header_contents)
#     end

#     # Add MKNetworkKit.h to the prefix header
#     prefix_header = config.project_pods_root + target.prefix_header_filename
#     prefix_header.open('a') do |file|
#       file.puts(%{#ifdef __OBJC__\n#import "MKNetworkKit.h"\n#endif})
#     end
#   end
# end


