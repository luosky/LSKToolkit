Pod::Spec.new do |s|
  s.name = 'KSAdvancedPicker'
  s.version = '0.0.1.130723'
  s.summary = 'Meant to overcome UIPickerView limitations.'
  s.homepage = 'https://github.com/keeshux/KSAdvancedPicker'
  s.license = 'MIT'
  s.author = 'keeshux'
  s.source = {
    :git => 'https://github.com/luosky/KSAdvancedPicker.git',
    :commit => 'e31b8c0d2a3a9fde7841b56872d4565b4ccd4faf'
  }
  s.platform = :ios, '5.0'
  s.source_files = 'Classes'
  s.requires_arc = true
end