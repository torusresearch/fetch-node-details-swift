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

// Global variable
var fndLogType = OSLogType.default

/// Provides ability to fetch information about torus nodes from a etherum contract.
open class FetchNodeDetails {
    
    var client: EthereumClientProtocol
    var network : EthereumNetwork = EthereumNetwork.ROPSTEN;
    var proxyAddress : EthereumAddress
    var walletAddress : EthereumAddress = EthereumAddress("0x5F7A02a42bF621da3211aCE9c120a47AA5229fBA")
    let yourContractABI: String = contractABIString
    public var nodeDetails : NodeDetails?
    var urlSession : URLSession
    
    /// Initiate a `FetchNodeDetails` instance.
    /// - Parameters:
    ///   - proxyAddress: Address to the etherum contract.
    ///   - network: Etherum network to be used.
    ///   - logLevel: Log level to be used. All logs that is below this level will be ignored.
    ///   - urlSession: URLSession object, usually used for mocking purposes. 
    public init(proxyAddress: String, network: EthereumNetwork, logLevel: OSLogType = .default, urlSession : URLSession = URLSession.shared){
        fndLogType = logLevel // to be used across application
        
        // mainnet proxy contract address - 0x638646503746d5456209e33a2ff5e3226d698bea
        // testnet proxt contract address - 0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183
        self.proxyAddress = EthereumAddress(proxyAddress)
        self.network = network
        
        self.urlSession = urlSession
        
        if(network == EthereumNetwork.MAINNET){
            let clientUrl = URL(string: "https://mainnet.infura.io/v3/b8cdb0e4cff24599a286bf8e87ff1c96")!
            self.client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
        }else{
            let clientUrl = URL(string: "https://ropsten.infura.io/v3/b8cdb0e4cff24599a286bf8e87ff1c96")!
            self.client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
        }
        
        
    }
    
}
