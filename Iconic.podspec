@version = '1.0.0-beta1'

Pod::Spec.new do |s|

  s.name            = 'Iconic'
  s.version         = @version
  s.summary         = 'Lightweight interface for icon font integration with UIKit'
  s.description     = 'Description soon'

  s.homepage        = 'http://github.com/dzenbot/Iconic'
  s.screenshots     = ''
  s.author          = { 'Ignacio Romero Zurbuchen' => 'iromero@dzen.cl' }

  s.license = {
      :type => 'MIT',
      :file => 'LICENSE'
  }

  s.source = {
      :git => 'http://github.com/dzenbot/Iconic.git',
      :tag => @version,
      :submodules => true
  }

  s.source_files    = 'Source/*.{swift}'
  s.resources       = 'Source/*.{ttf,otf}'
  s.preserve_paths  = 'Source/Iconizer/catalog/**/*.*'
  s.framework       = 'UIKit', 'CoreText'

  s.ios.deployment_target = '8.0'
  s.tvos.deployment_target = '9.0'
  s.watchos.deployment_target = '2.2'
  
  # If not specified, FontAwesome is used as the default font
  font_path = ENV['FONT_PATH'] ? ENV['FONT_PATH'] : 'Playground/Fonts/FontAwesome.ttf'

  s.prepare_command = <<-CMD
                      cd Vendor/SwiftGen/ && rake install
                      cd ../..
                      sh Source/Iconizer/Iconizer.sh #{font_path} Source/ --verbose
                      CMD

end
