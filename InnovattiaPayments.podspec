#
# Be sure to run `pod lib lint InnovattiaPayments.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'InnovattiaPayments'
  s.version          = '1.0.0'
  s.summary          = 'Pasarela de pagos de Innovattia'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = "Pasarela de pagos de Innovattia Pasarela de pagos de Innovattia Pasarela de pagos de Innovattia Pasarela de pagos de Innovattia Pasarela de pagos de Innovattia Pasarela de pagos de Innovattia"

  s.homepage         = 'https://github.com/sLuisGarcia/InnovattiaPayments'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Luis García' => 'jorge.garcia@innovattia.com' }
  s.source           = { :git => 'https://github.com/sLuisGarcia/InnovattiaPayments.git', :tag => s.version.to_s }


  s.ios.deployment_target = '11.0'
  s.swift_version = '4.0'
  s.source_files = 'InnovattiaPayments/Classes/**/*'
  
  # s.resource_bundles = {
  #   'InnovattiaPayments' => ['InnovattiaPayments/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  s.dependency 'SrPago-Ecommerce'
  s.dependency 'DropDown'
end
