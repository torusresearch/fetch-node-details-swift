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

open class FetchNodeDetails {
    
    var client: EthereumClientProtocol
    var network : EthereumNetwork = EthereumNetwork.MAINNET;
    var proxyAddress : EthereumAddress
    var projectID:String = "7f287687b3d049e2bea7b64869ee30a3"
    let yourContractABI: String = contractABIString
    var urlSession : URLSession
    
    public init(proxyAddress: String, network: EthereumNetwork, logLevel: OSLogType = .default, urlSession : URLSession = URLSession.shared){
        fndLogType = logLevel // to be used across application
        
        self.proxyAddress = EthereumAddress(proxyAddress)
        self.network = network
        
        self.urlSession = urlSession
        let clientUrl = URL(string: "https://\(network.rawValue).infura.io/v3/\(projectID)")!
        self.client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
        
    }
}

enum FNDError: Error{
    case infoFailed
    case allNodeDetailsFailed
    case transactionEncodingFailed
    case decodingFailed
}
