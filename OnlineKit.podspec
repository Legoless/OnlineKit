Pod::Spec.new do |s|
  s.name     = 'OnlineKit'
  s.version  = '0.1.0'
  s.license  = 'MIT'
  s.summary  = 'All in one solution for web service models.'
  s.homepage = 'https://github.com/legoless/OnlineKit.git'
  s.authors  = { 'Dal Rupnik' => 'legoless@gmail.com' }
  s.source   = { :git => 'https://github.com/legoless/OnlineKit.git', :tag => "0.1.0" }
  s.platform = :ios, '7.0'
  s.requires_arc = true

  s.ios.deployment_target = '7.0'

  s.public_header_files = 'OnlineKit/*.h'
  s.source_files = 'OnlineKit/OnlineKit.h'

  s.subspec 'Core' do |ss|
    ss.source_files = 'OnlineKit/Core/*.{h,m}'
    
    ss.dependency 'AuthKit/Core'
  end

  s.subspec 'GitHub' do |ss|
    ss.source_files = 'OnlineKit/GitHub/*.{h,m}'
    
    ss.dependency 'AuthKit/GitHub'
    ss.dependency 'OnlineKit/Core'
  end
  
  s.subspec 'Crashlytics' do |ss|
    ss.source_files = 'OnlineKit/Crashlytics/*.{h,m}'
    
    ss.dependency 'AuthKit/Crashlytics'
    ss.dependency 'OnlineKit/Core'
  end
  
  #s.subspec 'Travis' do |ss|
  #  ss.source_files = 'OnlineKit/GitHub/*.{h,m}'
  #
  #  ss.dependency 'AuthKit/Travis'
  #  ss.dependency 'OnlineKit/Core'
  #end
end
