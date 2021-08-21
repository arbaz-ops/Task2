# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Task2' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!

  # Pods for Task2
  pod 'SwiftSocket'

end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    if ['SwiftSocket'].include? target.name
      target.build_configurations.each do |config|
        config.build_settings['SWIFT_VERSION'] = '5'
      end
    end
  end
end