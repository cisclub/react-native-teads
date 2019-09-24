
Pod::Spec.new do |s|
  s.name         = "RNTeads"
  s.version      = "1.0.0"
  s.summary      = "RNTeads"
  s.description  = <<-DESC
                      React Native Teads
                      DESC
  s.homepage     = "https://www.npmjs.com/package/react-native-teads"
  s.license      = "MIT"
  # s.license      = { :type => "MIT", :file => "FILE_LICENSE" }
  s.author             = { "author" => "author@domain.cn" }
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/author/RNTeads.git", :tag => "master" }
  s.source_files  = "RNTeads/**/*.{h,m}"
  s.requires_arc = true


  s.dependency "React"
  #s.dependency "others"

end

  
