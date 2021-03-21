# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

target 'Lesson_5' do
  # Comment the next line if you don't want to use dynamic frameworks
  use_frameworks!
  
  pod 'SwiftLint'
  pod 'SDWebImage'

  
  #  Exclude DEPLOYMENT_TARGET warnings
    post_install do |installer|
      installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
          config.build_settings.delete 'IPHONEOS_DEPLOYMENT_TARGET'
        end
      end
    end
  # Pods for Lesson_5

end
