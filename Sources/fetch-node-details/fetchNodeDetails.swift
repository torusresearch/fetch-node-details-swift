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
    private var nodeDetails : NodeDetails
    
    
    public init(){
        self.web3 = Web3.InfuraMainnetWeb3()
        self.nodeDetails = NodeDetails()
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
        guard let newEpoch = epoch else { return 0}
        //print(epoch, newEpoch)
        return Int("\(newEpoch)")!
    }
    
    public func getEpochInfo(epoch : Int) throws -> EpochInfo{
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
        
        guard let id = result["id"] else { throw "asdf"}
        guard let n = result["n"] else { throw "asdf"}
        guard let k = result["k"] else { throw "asdf"}
        guard let t = result["t"] else { throw "asdf"}
        guard let prevEpoch = result["prevEpoch"] else { throw "asdf"}
        guard let nextEpoch = result["nextEpoch"] else { throw "asdf"}
        
        let object = EpochInfo(_id: "\(id)", _n: "\(n)", _k: "\(k)", _t: "\(t)", _nodeList: nodeList as! Array<String>, _prevEpoch: "\(prevEpoch)", _nextEpoch: "\(nextEpoch)")
        return object
    }
    
    public func getNodeEndpoint(nodeEthAddress: String) throws -> NodeInfo {
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
        
        // Unwraping Any? -> Any
        guard let declaredIp = result["declaredIp"] else { throw "some error" }
        guard let position = result["position"] else { throw "some error" }
        guard let pubKx = result["pubKx"] else { throw "some error" }
        guard let pubKy = result["pubKy"] else { throw "some error" }
        guard let tmP2PListenAddress = result["tmP2PListenAddress"] else { throw "some error" }
        guard let p2pListenAddress = result["p2pListenAddress"] else { throw "some error" }

        let object = NodeInfo(_declaredIp: "\(declaredIp)", _position: "\(position)", _pubKx: "\(pubKx)", _pubKy: "\(pubKy)", _tmP2PListenAddress: "\(tmP2PListenAddress)", _p2pListenAddress: "\(p2pListenAddress)")
        return object
    }
    
    public func getNodeDetails(){
        //if(self.nodeDetails.getUpdated()) return this.nodeDetails
        let currentEpoch = self.getCurrentEpoch();
        print(self.proxyAddress.address)
//        let newNodeDetails = NodeDetails()
        
        self.nodeDetails.setNodeListAddress(nodeListAddress: self.proxyAddress.address);
        self.nodeDetails.setCurrentEpoch(currentEpoch: String(currentEpoch));
         // self.nodeDetails.setTorusNodeIndexes()
        
        
        let epochInfo = try! getEpochInfo(epoch: currentEpoch);
        let nodelist = epochInfo.getNodeList();
        
        var torusIndexes:[BigInt] = Array()
        var nodeEndPoints:[NodeInfo] = Array()
        
        for i in 0..<nodelist.count{
            torusIndexes.append(BigInt(i+1))
            nodeEndPoints.append(try! getNodeEndpoint(nodeEthAddress: nodelist[i]))
        }
        
        
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

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
