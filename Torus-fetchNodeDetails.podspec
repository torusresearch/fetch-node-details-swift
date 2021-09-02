Pod::Spec.new do |spec|
  spec.name         = "Torus-fetchNodeDetails"
  spec.version      = "1.0.2"
  spec.platform = :ios, "11.0"
  spec.summary      = "Fetches the node details from torus nodelist smart contract"
  spec.homepage     = "https://github.com/torusresearch/fetch-node-details-swift"
  spec.license      = { :type => 'BSD', :file => 'License.md' }
  spec.swift_version   = "5.0"
  spec.author       = { "Shubham Rathi" => "rathishubham017@gmail.com" }
  spec.source       = { :git => "https://github.com/torusresearch/fetch-node-details-swift.git", :tag => spec.version }
  spec.source_files = "Sources/FetchNodeDetails/*.{swift,json}","Sources/FetchNodeDetails/**/*.{swift,json}"
  spec.module_name = "FetchNodeDetails"
  spec.dependency 'BestLogger', '~> 0.0.1'
  spec.dependency 'web3.swift', '~> 0.8.0'
  spec.dependency 'PromiseKit/Foundation', '~> 6.0'
  spec.pod_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
  spec.user_target_xcconfig = { 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'arm64' }
end
