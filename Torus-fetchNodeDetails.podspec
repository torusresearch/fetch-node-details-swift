Pod::Spec.new do |spec|
  spec.name         = "Torus-fetchNodeDetails"
  spec.version      = "0.0.12"
  spec.platform = :ios, "10.0"
  spec.summary      = "Fetches the node details from torus nodelist smart contract"
  spec.homepage     = "https://github.com/torusresearch/fetch-node-details-swift"
  spec.license      = { :type => 'BSD', :file => 'License.md' }
  spec.swift_version   = "5.0"
  spec.author       = { "Shubham Rathi" => "rathishubham017@gmail.com" }
  spec.source       = { :git => "https://github.com/torusresearch/fetch-node-details-swift.git", :tag => "0.0.12" }
  spec.source_files = "Sources/FetchNodeDetails/*.{swift,json}","Sources/FetchNodeDetails/**/*.{swift,json}"
  spec.module_name = "FetchNodeDetails"
  spec.dependency 'web3swift', '~> 2.2.0'
end
