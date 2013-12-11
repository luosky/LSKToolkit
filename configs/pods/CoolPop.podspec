Pod::Spec.new do |s|
  s.name = 'CoolPop'
  s.version = '0.0.1.130617002'
  s.summary = 'Drag to pop, works like 网易新闻, 新浪微博'
  s.homepage = 'https://github.com/aelam/CoolPop-iOS'
  s.license = 'MIT'
  s.author = 'aelam'
  s.source = {
    :git => 'https://github.com/luosky/CoolPop-iOS.git',
    :commit => 'b75c27e9cf66512ae6fd91a71bdd4da434ea5444'
  }
  s.platform = :ios, '5.0'
  s.source_files = 'CoolPop/UISwipeNavigaionController'
  s.frameworks = 'CoreGraphics', 'QuartzCore'
  s.requires_arc = false
end