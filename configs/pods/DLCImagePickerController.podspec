Pod::Spec.new do |s|
  s.name         = "DLCImagePickerController"
  s.version      = "0.0.1.121223"
  s.summary      = "ImagePickerController with live filters, radial blur and more. Brought to you by the fine ladies and gents at Backspaces."
  s.description  = <<-DESC
                    DLCImagePickerController is a fast, beautiful and fun way to filter and capture your photos with OpenGL and your iPhone.
                    The majority of the praise should be directed towards BradLarson for his GPUImage library.
                   DESC
  s.homepage     = "www.backspac.es"
  s.license      = 'BSD'
  s.author       = { "Dmitri Cherniak" => "dmitric@gmail.com" }
  s.source       = { :git => "https://github.com/luosky/DLCImagePickerController.git", :commit => 'f999d5b08877e237e11dfd8f9601e5eea501ca9c' }
  s.platform     = :ios, '5.0'
  s.requires_arc = true
  # s.dependency 'GPUImage@siuying', :head
  s.dependency 'GPUImage@siuying'
  s.framework    = 'AssetsLibrary'

  s.subspec 'Core' do |sp|
    sp.source_files = 'Classes'
    sp.resources = "Resources/**/*.*", "Images/{UI,Overlays}/*.png"
    # Temporary, this might break the podspec in the future.

  end

  s.subspec 'FilterSamples' do |sp|
    sp.resources = "Images/FilterSamples/*.jpg"
  end
end
