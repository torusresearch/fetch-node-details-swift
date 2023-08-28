Pod::Spec.new do |spec|
  spec.name         = "Torus-fetchNodeDetails"
  spec.version      = "5.0.0"
  spec.ios.deployment_target = '13.0'
  spec.summary      = "Fetches the node details from torus nodelist smart contract"
  spec.homepage     = "https://github.com/torusresearch/fetch-node-details-swift"
  spec.license      = { :type => 'BSD', :file => 'License.md' }
  spec.swift_version   = "5.3"
  spec.author       = { "Shubham Rathi" => "rathishubham017@gmail.com" }
  spec.source       = { :git => "https://github.com/torusresearch/fetch-node-details-swift.git", :tag => spec.version }
  spec.source_files = "Sources/FetchNodeDetails/*.{swift,json}","Sources/FetchNodeDetails/**/*.{swift,json}"
  spec.source_files = "Sources/FndBase/*.{swift,json}","Sources/FndBase/**/*.{swift,json}"
  spec.source_files = "Sources/CommonSources/*.{swift,json}","Sources/CommonSources/**/*.{swift,json}"
  spec.module_name = "FetchNodeDetails"
  spec.dependency 'BigInt', '~> 5.2.0'

end
