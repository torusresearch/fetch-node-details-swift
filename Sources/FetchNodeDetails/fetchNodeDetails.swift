//
//  File.swift
//
//
//  Created by Shubham on 13/3/20.
//

import Foundation
import web3
import BigInt
import OSLog
import PromiseKit

// Global variable
var fndLogType = OSLogType.default

open class FetchNodeDetails {
    
    var currentEpoch = "19"
    
    var torusNodeEndpoints = [
        "https://torus-19.torusnode.com/jrpc",
        "https://torus-node.ens.domains/jrpc",
        "https://torus-node.matic.network/jrpc",
        "https://torus.zilliqa.network/jrpc",
        "https://torus-mainnet.cosmos.network/jrpc",
        "https://torus2.etherscan.com/jrpc",
        "https://torus-node-v2.skalelabs.com/jrpc",
        "https://torus-node.binancex.dev/jrpc",
        "https://torusnode.ont.io/jrpc",
      ]
    
var torusNodePub: [TorusNodePub] = [
    .init(_X: "bbe83c64177c3775550e6ba6ac2bc059f6847d644c9e4894e42c60d7974d8c2b", _Y:
            "82b49a7caf70def38cdad2740af45c1e4f969650105c5019a29bb18b21a9acb5"),
    .init(_X: "bbe83c64177c3775550e6ba6ac2bc059f6847d644c9e4894e42c60d7974d8c2b", _Y:
            "c7db2fe4631109f40833de9dc78d07e35706549ee48fa557b33e4e75e1047873"),
    .init(_X: "ca1766bb426d4ca5582818a0c5439d560ea64f5baa060793ab29dd3d0ceacfe", _Y:
            "d46c1d08c40e1306e1bca328c2287b8268166b11a1ba4b8442ea2ad0c5e32152"),
    .init(_X: "c3934dd2f6f4b3d2e1e398cc501e143c1e1a381b52feb6d1525af34d16253768", _Y:
            "71f5141a5035799099f5ea3e241e66946bc55dc857ac3bd7d6fcdb8dcd3eeeef"),
    .init(_X: "22e66f1929631d00bf026227581597f085fd94fd952fc0dca9f0833398b5c064", _Y:
            "6088b3912e10a1e9d50355a609c10db7d188f16a2e2fd7357e51bf4f6a74f0a1"),
    .init(_X: "9dc9fa410f3ce9eb70df70cdea00a49f2c4cc7a31c08c0dab5f863ed35ff5139", _Y:
            "627a291cb87a75c61da3f65d6818e1e05e360217179817ed27e8c73bca7ec122"),
    .init(_X: "bbe83c64177c3775550e6ba6ac2bc059f6847d644c9e4894e42c60d7974d8c2b", _Y:
            "82b49a7caf70def38cdad2740af45c1e4f969650105c5019a29bb18b21a9acb5"),
    .init(_X: "118b9fc07e97b096d899b9f6658463ce6a8caa64038e37fc969df4e6023dd8c6", _Y:
            "baf9fa4e51770f4796ea165dd03a769b8606681a38954a0a92c4cbffd6609ce9"),
    .init(_X: "8a6d8b925da15a273dec3d8f8395ec35cd6878f274b2b180e4e106999db64043", _Y:
            "96f67f870c157743da0b1eb84d89bf30500d74dc84c11f501ee1cb013acc8c46"),
    .init(_X: "39cecb62e863729f572f7dfc46c24867981bf04bb405fed0df39e33984bfade5", _Y:
            "61c2364434012e68a2be2e9952805037e52629d7762fafc8e10e9fb5bad8f790")
    ]
    
    var torusIndexes:[BigInt] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    
    var defaultNodeDetails:AllNodeDetails
    
    var client: EthereumClientProtocol
    var network : EthereumNetwork = EthereumNetwork.ROPSTEN;
    var proxyAddress : EthereumAddress
    var walletAddress : EthereumAddress = EthereumAddress("0x5F7A02a42bF621da3211aCE9c120a47AA5229fBA")
    let yourContractABI: String = contractABIString
    public var nodeDetails : NodeDetails?
    var urlSession : URLSession
    var verifierNodeSetMap = [String:[EthereumAddress]]()
    var updated = false
    public init(proxyAddress: String, network: EthereumNetwork, logLevel: OSLogType = .default, urlSession : URLSession = URLSession.shared){
        fndLogType = logLevel // to be used across application
        
        // mainnet proxy contract address - 0x638646503746d5456209e33a2ff5e3226d698bea
        // testnet proxt contract address - 0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183
        
        self.proxyAddress = EthereumAddress(proxyAddress)
        self.network = network
        updated = true
        self.urlSession = urlSession
        
//        if(network == EthereumNetwork.MAINNET){
//            let clientUrl = URL(string: "https://mainnet.infura.io/v3/b8cdb0e4cff24599a286bf8e87ff1c96")!
//            self.client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
//        }else{
//            let clientUrl = URL(string: "https://ropsten.infura.io/v3/b8cdb0e4cff24599a286bf8e87ff1c96")!
//            self.client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
//        }
        let clientUrl = URL(string: "https://\(network.rawValue).infura.io/v3/b8cdb0e4cff24599a286bf8e87ff1c96")!
        self.client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
        defaultNodeDetails = .init(_currentEpoch: currentEpoch, _nodeListAddress:self.proxyAddress.value , _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
        
    }
    
}





