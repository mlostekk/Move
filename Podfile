# Uncomment the next line to define a global platform for your project
platform :osx, '10.15'

### MOVE MAIN PODS
target 'Move' do
  use_frameworks!

end

### TESTING PODS
target 'MoveTests' do
  use_frameworks!

  pod 'Nimble'

end

### Post install script
post_install do |pi|
   pi.pods_project.targets.each do |t|
       t.build_configurations.each do |bc|
           bc.build_settings['MACOSX_DEPLOYMENT_TARGET'] = '10.15'
       end
   end
end
