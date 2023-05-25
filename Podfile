# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'login' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  pod 'SnapKit'
  pod 'RKMFunNative', :path => '../RKMFunNative'
  pod 'VideoToolboxPlus', :path => '../RKMFunNative/VideoToolboxPlus'
  pod 'U3DBirdge', :path => '../RKMFunNative/U3DBirdge'
  pod 'DGElasticPullToRefresh', :path => '../RKMFunNative/DGElasticPullToRefresh'
  pod 'RKBase',  :git => 'https://gitlab.rokid-inc.com/mobile/ios/RKBase.git'
  pod 'SJVideoPlayer', :path => '../RKMFunNative/ZFPlayer'
#  pod 'ZFPlayer/AVPlayer', :path => '../RKMFunNative/ZFPlayer'
#  pod 'ZFPlayer/ControlView', :path => '../RKMFunNative/ZFPlayer'
#  pod 'ZFPlayer/ijkplayer', :path => '../RKMFunNative/ZFPlayer'
  
  #pod 'MobileVLCKit', :path =>'../MobileVLCKit'
  # Pods for Unity-iPhone
  pod 'LookinServer', :configurations => ['Debug']
  pod 'Masonry'
  # Pods for login

  target 'loginTests' do
    inherit! :search_paths
    # Pods for testing
  end

  target 'loginUITests' do
    # Pods for testing
  end

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
    config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '12.0'
    config.build_settings['ENABLE_BITCODE'] = 'NO'
    end
   end
end
