//
//  File.swift
//  
//
//  Created by Shubham on 9/4/21.
//

import Foundation
import web3swift
import BestLogger
import PromiseKit

public class VerifierListContract {
    public var verifierABI = verifierList_ABI
    var web3 : web3
    var network : EthereumNetwork = EthereumNetwork.ROPSTEN;
    var proxyAddress : EthereumAddress = EthereumAddress("0xC4c6463988bD5B9B4B633Ff8A295403e4EE166CA")!
    var walletAddress : EthereumAddress = EthereumAddress("0x5F7A02a42bF621da3211aCE9c120a47AA5229fBA")!
    var contract : web3.web3contract
    let logger: BestLogger?

    public init(network: EthereumNetwork, logLevel: BestLogger.Level = .none){
        // mainnet verifierList contract address - 0xa24793e5da2bdbba7d48068a36048145733ecec7
        // testnet verifierList contract address - 0xC4c6463988bD5B9B4B633Ff8A295403e4EE166CA
        self.network = network
        
        if(network == EthereumNetwork.MAINNET){
            self.proxyAddress = EthereumAddress("0xa24793e5da2bdbba7d48068a36048145733ecec7")!
            self.web3 = Web3.InfuraMainnetWeb3(accessToken: "b8cdb0e4cff24599a286bf8e87ff1c96")
            self.contract = web3.contract(verifierABI, at: self.proxyAddress, abiVersion: 2)!
        }else{
            self.proxyAddress = EthereumAddress("0xC4c6463988bD5B9B4B633Ff8A295403e4EE166CA")!
            self.web3 = Web3.InfuraRopstenWeb3(accessToken: "b8cdb0e4cff24599a286bf8e87ff1c96")
            self.contract = web3.contract(verifierABI, at: self.proxyAddress, abiVersion: 2)!
        }
        
        self.logger = BestLogger(label: "verifierList: ", level: logLevel)
    }
    
    func verifierExists(verifier: String) -> Promise<Bool>{
        let contractMethod = "verifiers" // Contract method you want to call
        let parameters: [AnyObject] = [verifier as AnyObject] // Parameters for contract method
        let extraData: Data = Data() // Extra data for contract method
        var options = TransactionOptions.defaultOptions
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        let tx = self.contract.read(
            contractMethod,
            parameters: parameters,
            extraData: extraData,
            transactionOptions: options)!
            
        
        let txPromise = tx.callPromise()
        let (tempPromise, seal) = Promise<Bool>.pending()
        
        txPromise.done{ data in
            let isCreated = data["isCreated"] as? Int
            let returnValue = isCreated == 1
            seal.fulfill(returnValue)
        }.catch{ err in
            seal.reject(err)
        }
        
        return tempPromise
    }
}
