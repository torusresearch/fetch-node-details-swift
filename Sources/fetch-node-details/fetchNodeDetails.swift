//
//  File.swift
//
//
//  Created by Shubham on 13/3/20.
//

import Foundation
import web3swift
import BigInt

public class FetchNodeDetails {
    
    private var web3 : web3
    private var network : EthereumNetwork = EthereumNetwork.MAINNET;
    private var proxyAddress : EthereumAddress = EthereumAddress("0x638646503746d5456209e33a2ff5e3226d698bea")!
    private var walletAddress : EthereumAddress = EthereumAddress("0x5F7A02a42bF621da3211aCE9c120a47AA5229fBA")!
    private let yourContractABI: String = contractABIString
    private var nodeDetails : NodeDetails!
    
    
    //    init(network : EthereumNetwork, proxyAddress: String) {
    //        self.network = network;
    //        self.proxyAddress = proxyAddress;
    //        //self.nodeDetails = NodeDetails();
    //        self.setupWeb3();
    //    }
    
    public init(){
        self.web3 = Web3.InfuraMainnetWeb3()
    }
    
    public func getCurrentEpoch() -> Int{
        
        //let abiVersion: Int = 2
        let contract = web3.contract(yourContractABI, at: proxyAddress, abiVersion: 2)!
        let contractMethod = "currentEpoch" // Contract method you want to call
        let parameters: [AnyObject] = [] // Parameters for contract method
        let extraData: Data = Data() // Extra data for contract method
        var options = TransactionOptions.defaultOptions
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        let tx = contract.read(
            contractMethod,
            parameters: parameters,
            extraData: extraData,
            transactionOptions: options)!
        
        let result : [String:Any] = try! tx.call()
        //print("result is", type(of: result.first?.value), result)
        let epoch = result.first?.value
        return Int("\(newEpoch)")!
    }
    
    public func getEpochInfo(epoch : Int) -> EpochInfo{
        let contractMethod = "getEpochInfo"
        let parameters: [AnyObject] = [18 as AnyObject] // Parameters for contract method
        let extraData: Data = Data() // Extra data for contract method
        let contract = web3.contract(yourContractABI, at: proxyAddress, abiVersion: 2)!
        var options = TransactionOptions.defaultOptions
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        //print(extraData)
        
        let tx = contract.read(
            contractMethod,
            parameters: parameters,
            extraData: extraData,
            transactionOptions: options)!
        //print(tx)
        
        let result = try! tx.call()
        print(result.keys)
        //print(result["prevEpoch"])
        
        var nodeList = result["nodeList"] as! Array<Encodable> //Unable to convert to Array<String>
        nodeList = nodeList.map{ (el) -> String in
            let address = el as! EthereumAddress
            return String(describing: address.address)
        }
        print(nodeList)
        
        let id = String(describing: result["id"] as Any)
        let n = String(describing: result["n"] as Any)
        let k = String(describing: result["k"] as Any)
        let t = String(describing: result["t"] as Any)
        let prevEpoch = String(describing: result["prevEpoch"] as Any)
        let nextEpoch = String(describing: result["nextEpoch"] as Any)
        
        let object = EpochInfo(_id: id, _n: n, _k: k, _t: t, _nodeList: nodeList as! Array<String>, _prevEpoch: prevEpoch, _nextEpoch: nextEpoch)
        return object
    }
    
    public func getNodeEndpoint(nodeEthAddress: String) -> NodeInfo{
        let contractMethod = "getNodeDetails"
        let parameters: [AnyObject] = [nodeEthAddress as AnyObject] // Parameters for contract method
        let extraData: Data = Data() // Extra data for contract method
        let contract = web3.contract(yourContractABI, at: proxyAddress, abiVersion: 2)!
        var options = TransactionOptions.defaultOptions
        options.from = walletAddress
        options.gasPrice = .automatic
        options.gasLimit = .automatic
        //print(extraData)
        
        let tx = contract.read(
            contractMethod,
            parameters: parameters,
            extraData: extraData,
            transactionOptions: options)!
        //print(tx)
        
        let result = try! tx.call()
        print(result.keys)
        print(result.values)
        
        let declaredIp = String(describing: result["declaredIp"] as Any)
        let position = String(describing: result["position"] as Any)
        let pubKx = String(describing: result["pubKx"] as Any)
        let pubKy = String(describing: result["pubKy"] as Any)
        let tmP2PListenAddress = String(describing: result["tmP2PListenAddress"] as Any)
        let p2pListenAddress = String(describing: result["p2pListenAddress"] as Any)
        
        let object = NodeInfo(_declaredIp: declaredIp, _position: position, _pubKx: pubKx, _pubKy: pubKy, _tmP2PListenAddress: tmP2PListenAddress, _p2pListenAddress: p2pListenAddress)
        return object
    }
    
    public func getNodeDetails(){
        //if(self.nodeDetails.getUpdated()) return this.nodeDetails
        let currentEpoch = self.getCurrentEpoch();
        self.nodeDetails.setNodeListAddress(nodeListAddress: String(describing: self.proxyAddress.address));
        self.nodeDetails.setCurrentEpoch(currentEpoch: String(currentEpoch));

        
    }
    
    private func setupWeb3() {
        //let contractAddress = try! EthereumAddress(hex: self.proxyAddress, eip55: false)
        //self.proxyContract = try! self.web3.eth.Contract(json: Data(contractABIString.utf8), abiKey: nil, address: contractAddress)
        //print(self.proxyContract.methods.count)
        //self.getCurrentEpoch()
        // print(self.proxyContract)
    }
    
    private func getProxyUrl() -> String{
        return "https://api.infura.io/v1/jsonrpc/" + self.network.rawValue;
    }
}
