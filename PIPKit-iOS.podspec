Pod::Spec.new do |s|
  s.name             = 'PIPKit-iOS'
  s.version          = '1.0.0'
  s.summary          = 'Picture-in-Picture library for iOS'
  s.description      = <<-DESC
    iOS용 Picture-in-Picture (PIP) 라이브러리입니다.
    UIViewController를 간단하게 PIP 모드로 전환할 수 있습니다.
    iOS 13+ Scene 기반 앱을 지원합니다.
  DESC

  s.homepage         = 'https://github.com/mobidoo-official/PIPKit-iOS'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Mobidoo' => 'dev@mobidoo.com' }
  s.source           = { :git => 'https://github.com/mobidoo-official/PIPKit-iOS.git', :tag => s.version.to_s }

  s.ios.deployment_target = '13.0'
  s.swift_version = '5.0'
  s.module_name = 'PIPKit'

  s.source_files = 'Sources/PIPKit/**/*'
  s.frameworks = 'UIKit'
end
