Pod::Spec.new do |spec|
  spec.name         = "Torus-fetchNodeDetails"
  spec.version      = "2.6.0"
  spec.platform = :ios, "11.0"
  spec.summary      = "Fetches the node details from torus nodelist smart contract"
  spec.homepage     = "https://github.com/torusresearch/fetch-node-details-swift"
  spec.license      = { :type => 'BSD', :file => 'License.md' }
  spec.swift_version   = "5.3"
  spec.author       = { "Shubham Rathi" => "rathishubham017@gmail.com" }
  spec.source       = { :git => "https://github.com/torusresearch/fetch-node-details-swift.git", :tag => spec.version }
  spec.source_files = "Sources/FetchNodeDetails/*.{swift,json}","Sources/FetchNodeDetails/**/*.{swift,json}"
  spec.module_name = "FetchNodeDetails"
  spec.dependency 'web3.swift', '~> 0.8.1'
 spec.resource_bundles = { 'Torus-fetchNodeDetails' => ['cocoapods/FND.bundle/*.json'] }
  spec.dependency 'PromiseKit/Foundation', '~> 6.0'
end
