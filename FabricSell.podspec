#
# Be sure to run `pod lib lint FabricSell.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FabricSell'
  s.version          = '1.0.5'
  s.summary          = 'This is all about giving and sharing and taking and receiving.'
  s.swift_version    = '4.0'
# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
In detail description I dont have anything to describe about this project
                       DESC

  s.homepage         = 'https://github.com/shahwal/FabricSell'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'shahwalkhan@gmail.com' => 'shahwalkhan@gmail.com' }
  s.source           = { :git => 'https://github.com/shahwal/FabricSell.git', :branch => 'master', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'FabricSell/Classes/**/*'
  
   s.resource_bundles = {
     'FabricSell' => ['FabricSell/**/*.{storyboard,xib,xcassets,json,imageset,png,ttf}', 'FabricSell/Resources/**/*.{xcassets,json,imageset,png,ttf}']
   }
   #  s.resources = 'FabricSell/Resources/*.ttf'
#   s.resources = ['FabricSell/Resources/Pod.bundle']
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
   s.dependency 'Alamofire'
   s.dependency 'SDWebImage'
end
