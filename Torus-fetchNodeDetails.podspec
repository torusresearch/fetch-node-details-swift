Pod::Spec.new do |spec|
  spec.name         = "Torus-fetchNodeDetails"
  spec.version      = "8.0.1"
  spec.ios.deployment_target = '13.0'
  spec.summary      = "Fetches the node details from torus nodelist smart contract"
  spec.homepage     = "https://github.com/torusresearch/fetch-node-details-swift"
  spec.license      = { :type => 'BSD', :file => 'License.md' }
  spec.swift_version   = "5.3"
  spec.author       = { "Torus Labs" => "hello@tor.us" }
  spec.source       = { :git => "https://github.com/torusresearch/fetch-node-details-swift.git", :tag => spec.version }
  spec.source_files = "Sources/**/*.{swift,json}"
  spec.module_name = "FetchNodeDetails"
  spec.dependency 'BigInt', '~> 5.2.0'
end
