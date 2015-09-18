Pod::Spec.new do |s|
  s.name             = "Tunits"
  s.version          = "0.3.1"
  s.summary          = "A date modification library"
  s.description      = <<-DESC
		       Tunits is a simple library of convenience functions for creating groups of NSDates
                       DESC

  s.homepage         = "https://github.com/spitzgoby/Tunits"
  s.license          = 'MIT'
  s.author           = { "Thomas Leu" => "tomleu@gmail.com" }
  s.source           = { :git => "https://github.com/spitzgoby/Tunits.git", :tag => s.version.to_s }

  s.platform     = :ios, '8.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'Tunits' => ['Pod/Assets/*.png']
  }

end
