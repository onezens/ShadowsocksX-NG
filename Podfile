# Uncomment this line to define a global platform for your project
# platform :ios, '9.0'

target 'ShadowsocksX-NG' do
  # Comment this line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!

  # Pods for ShadowsocksX-NG
  pod 'Alamofire'
  pod 'GCDWebServer', '~> 3.0'

  target 'ShadowsocksX-NGTests' do
    inherit! :search_paths
    # Pods for testing
  end

end

target 'proxy_conf_helper' do
  pod 'BRLOptionParser'
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '5.0'
    end
  end
end
