#
# Be sure to run `pod lib lint FlowUI.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FlowUI'
  s.version          = '0.2.4'
  s.summary          = 'A set of useful extensions for rapid UI prototyping based on UIKit'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A set of convenient initializers and extensions for rapid UI prototyping, based on the idea of using results builders with UIStackView and chained methods.
                       DESC

  s.homepage         = 'https://github.com/GrooveDeluxe/FlowUI'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'groovedeluxe@gmail.com' => 'groovedeluxe@gmail.com' }
  s.source           = { :git => 'https://github.com/GrooveDeluxe/FlowUI.git', :tag => s.version.to_s }
#  s.social_media_url = 'https://twitter.com/GrooveDeluxe'

  s.ios.deployment_target = '13.0'
  s.swift_versions = '5.0'

  s.source_files = 'Sources/**/*'

end
