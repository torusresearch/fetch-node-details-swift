Pod::Spec.new do |spec|
  spec.name         = "TorusFetchNodeDetails"
  spec.version      = "0.0.7"
  spec.platform = :ios, "10.0"
  spec.summary      = "Fetches the node details from torus nodelist smart contract"
  spec.homepage     = "https://github.com/torusresearch/fetch-node-details-swift"
  spec.license      = "BSD 3.0"
  spec.swift_version   = "5.0"
  spec.author       = { "Torus Labs" => "rathishubham017@gmail.com" }
  spec.source       = { :git => "https://github.com/torusresearch/fetch-node-details-swift.git", :tag => "0.0.7" }
  spec.source_files = "Sources/FetchNodeDetails/*.{swift,json}, Sources/FetchNodeDetails/**/*.{swift,json}, FetchNodeDetails/**/*.{swift,json}, FetchNodeDetails/*.{swift,json}, Sources/Classes/*.{swift,json}, Sources/Classes/**/*.{swift,json}"
  spec.dependency 'web3swift', '~> 2.2.0'
end
