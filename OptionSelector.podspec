Pod::Spec.new do |spec|
  spec.name         = "OptionSelector"
  spec.version      = "0.2.2"
  spec.summary      = "Easily manage selecing item(s) from a list or array."
  spec.homepage     = "https://github.com/inickt/OptionSelector"
  spec.license      = { :type => "MIT", :file => "LICENSE" }
  spec.author             = { "Nick Thompson" => "me@nickt.dev" }
  spec.social_media_url   = "https://twitter.com/inickt_"

  spec.swift_version = "5"
  spec.ios.deployment_target = "8.0"
  spec.source       = { :git => "https://github.com/inickt/OptionSelector.git", :tag => spec.version }
  spec.source_files  = "Source/**/*.{h,swift}"
end
