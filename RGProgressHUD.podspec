Pod::Spec.new do |spec|
  spec.name         =  'RGProgressHUD'
  spec.version      =  '1.0'
  spec.summary   =  'RGProgressHUD is an iOS progress HUD written in Swift.'
  spec.author = {
    'Ritesh Gupta' => 'rg.riteshh@gmail.com'
  }
  spec.license          =  'MIT' 
  spec.homepage         =  'https://github.com/riteshhgupta/RGProgressHUD'
  spec.source = {
    :git => 'https://github.com/riteshhgupta/RGProgressHUD.git',
    :tag => '1.0'
  }
  spec.ios.deployment_target = "9.0"
  spec.source_files =  'Source/*.{swift}'
  spec.requires_arc =  true

  spec.subspec 'Core' do |core|
      core.source_files = 'Source/*.swift'
      core.exclude_files = 'Source/RGProgressHUDProvider+Reactive.swift'
  end

  spec.subspec 'ReactiveSwift' do |reactiveswift|
      reactiveswift.dependency 'RGProgressHUD/Core'
      reactiveswift.dependency 'ReactiveSwift', '~> 2.0'
      reactiveswift.dependency 'ReactiveCocoa', '~> 6.0'
      reactiveswift.source_files = 'Source/RGProgressHUDProvider+Reactive.swift'
  end

  spec.default_subspec = 'Core'
end
