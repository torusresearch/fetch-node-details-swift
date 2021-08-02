//
//  File.swift
//
//
//  Created by Shubham on 13/3/20.
//

import Foundation
import web3
import BigInt
import PromiseKit

struct SimpleTuple: ABITuple{
    
    static var types: [ABIType.Type] { [BigUInt.self, BigUInt.self, BigUInt.self, BigUInt.self, ABIArray<EthereumAddress>.self, BigUInt.self, BigUInt.self] }
    
    var id: BigUInt
    var n: BigUInt
    var k: BigUInt
    var t: BigUInt
    var nodeList: ABIArray<EthereumAddress>
    var prevEpoch: BigUInt
    var nextEpoch: BigUInt
    
    init(id: BigUInt,
    n: BigUInt,
    k: BigUInt,
    t: BigUInt,
    nodeList: ABIArray<EthereumAddress>,
    prevEpoch: BigUInt,
    nextEpoch: BigUInt) {
        self.id =  id
        self.n =      n
        self.k =      k
        self.t =      t
        self.nodeList =      nodeList
        self.prevEpoch =      prevEpoch
        self.nextEpoch =      nextEpoch
    }
    
    init?(values: [ABIDecoder.DecodedValue]) throws {
        self.id = try values[0].decoded()
        self.n =     try values[1].decoded()
        self.k =     try values[2].decoded()
        self.t =     try values[3].decoded()
        self.nodeList =     try values[4].decoded()
        self.prevEpoch =     try values[5].decoded()
        self.nextEpoch =     try values[6].decoded()
    }
    
    init?(values: [ABIDecoder.DecodedValue]) throws {
        self.owners = try values.map { try $0.decoded() }
    }
    
    func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(id)
        try encoder.encode(    n)
        try encoder.encode(    k)
        try encoder.encode(    t)
        try encoder.encode(    nodeList)
        try encoder.encode(    prevEpoch)
        try encoder.encode(    nextEpoch)
    }
    
    var encodableValues: [ABIType] { [id, n, k, t, nodeList, prevEpoch, nextEpoch] }
}

extension FetchNodeDetails {
    
    public func getCurrentEpochPromise() throws -> Promise<Int>{
        let function = NodeListProxyContract.CurrentEpoch(contract: self.proxyAddress)
        let transaction = try! function.transaction()
        let (tempPromise, seal) = Promise<Int>.pending()

        client.eth_call(transaction, block: .Latest) { (error, epoch) in
//            print("Epoch is: ", epoch)
            let b = Int(hex: epoch!) ?? -1
            seal.fulfill(b)
        }

        return tempPromise
    }
    
    public func getEpochInfoPromise(epoch : Int) throws -> Promise<Int>{
        
        
        let keyStorage = EthereumKeyLocalStorage()
        let account = try? EthereumAccount.create(keyStorage: keyStorage, keystorePassword: "MY_PASSWORD")

        
        let function = NodeListProxyContract.getEpochInfo(contract: self.proxyAddress, epoch: 19)
        let transaction = try! function.transaction()
        let (tempPromise, seal) = Promise<Int>.pending()
//
        client.eth_call(transaction, block: .Latest) { (error, epoch) in
            print("Epoch is: ", epoch)
            
            let el = try? ABIDecoder.decodeData(epoch!, types: [SimpleTuple.self], asArray: true)
            
            let b = Int(hex: epoch!) ?? -1
            seal.fulfill(b)
        }
        
        
//        client.eth_sendRawTransaction(transaction, withAccount: account!) { (error, epoch) in
//            print("Epoch is: ", epoch)
//
//
//            let b = Int(hex: epoch!) ?? -1
//            seal.fulfill(b)
//        }
        
        return tempPromise
        
//        let contractMethod = "getEpochInfo"
//        let parameters: [AnyObject] = [epoch as AnyObject] // Parameters for contract method
//        let extraData: Data = Data() // Extra data for contract method
//        var options = TransactionOptions.defaultOptions
//        options.from = walletAddress
//        options.gasPrice = .automatic
//        options.gasLimit = .automatic
//
//        let tx = self.contract.read(
//            contractMethod,
//            parameters: parameters,
//            extraData: extraData,
//            transactionOptions: options)!
//
//        let returnPromise = Promise<EpochInfo>{ seal in
//            let txPromise = tx.callPromise()
//            txPromise.done{ response in
//                var nodeList = response["nodeList"] as! Array<Encodable> //Unable to convert to Array<String>
//                nodeList = nodeList.map{ (el) -> String in
//                    let address = el as! EthereumAddress
//                    return String(describing: address.address)
//                }
//                //print(nodeList)
//
//                guard let id = response["id"] else { throw "Casting for id from Any? -> Any failed"}
//                guard let n = response["n"] else { throw "Casting for n from Any? -> Any failed"}
//                guard let k = response["k"] else { throw "Casting for k from Any? -> Any failed"}
//                guard let t = response["t"] else { throw "Casting for t from Any? -> Any failed"}
//                guard let prevEpoch = response["prevEpoch"] else { throw "Casting for prevEpoch from Any? -> Any failed"}
//                guard let nextEpoch = response["nextEpoch"] else { throw "Casting for nextEpoch from Any? -> Any failed"}
//
//                let object = EpochInfo(_id: "\(id)", _n: "\(n)", _k: "\(k)", _t: "\(t)", _nodeList: nodeList as! Array<String>, _prevEpoch: "\(prevEpoch)", _nextEpoch: "\(nextEpoch)")
//                //print()
//                seal.fulfill(object)
//
//            }.catch{error in
//                seal.reject(error)
//            }
//
//        }
//        return returnPromise
    }

//    public func getNodeEndpointPromise(nodeEthAddress: String) -> Promise<NodeInfo> {
//        let contractMethod = "getNodeDetails"
//        let parameters: [AnyObject] = [nodeEthAddress as AnyObject] // Parameters for contract method
//        let extraData: Data = Data() // Extra data for contract method
//        var options = TransactionOptions.defaultOptions
//        options.from = walletAddress
//        options.gasPrice = .automatic
//        options.gasLimit = .automatic
//        //print(extraData)
//
//        let tx = self.contract.read(
//            contractMethod,
//            parameters: parameters,
//            extraData: extraData,
//            transactionOptions: options)!
//
//        let returnPromise = Promise<NodeInfo>{ seal in
//            let txPromise = tx.callPromise()
//            txPromise.done{ response in
//                // Unwraping Any? -> Any
//                guard let declaredIp = response["declaredIp"] else { throw "Casting for declaredIp from Any? to Any failed" }
//                guard let position = response["position"] else { throw "Casting for position from Any? to Any failed" }
//                guard var pubKx = response["pubKx"] else { throw "Casting for pubKx from Any? to Any failed" }
//                guard var pubKy = response["pubKy"] else { throw "Casting for pubKy from Any? to Any failed" }
//                guard let tmP2PListenAddress = response["tmP2PListenAddress"] else { throw "Casting for tmP2PListenAddress from Any? to Any failed" }
//                guard let p2pListenAddress = response["p2pListenAddress"] else { throw "Casting for p2pListenAddress from Any? to Any failed" }
//
//                //Change to hex
//                pubKx = String(BigInt("\(pubKx)", radix:10)!, radix:16, uppercase: true)
//                pubKy = String(BigInt("\(pubKy)", radix:10)!, radix:16, uppercase: true)
//
//                let object = NodeInfo(_declaredIp: "\(declaredIp)", _position: "\(position)", _pubKx: "\(pubKx)", _pubKy: "\(pubKy)", _tmP2PListenAddress: "\(tmP2PListenAddress)", _p2pListenAddress: "\(p2pListenAddress)")
//                seal.fulfill(object)
//            }.catch{err in seal.reject(err)}
//        }
//        return returnPromise
//    }
//
//    public func getNodeDetailsPromise() throws -> Promise<NodeDetails>{
//        var currentEpoch: Int = -1;
//        var torusIndexes:[BigInt] = Array()
//
//        let returnPromise = Promise<NodeDetails> { seal in
//            let currentEpochPromise = try self.getCurrentEpochPromise();
//            currentEpochPromise.then{ response -> Promise<EpochInfo> in
//                currentEpoch = response
//                return try self.getEpochInfoPromise(epoch: response)
//            }.then{epochInfo -> Guarantee<[Result<NodeInfo>]> in
//                let nodelist = epochInfo.getNodeList();
//                var getNodeInfoPromisesArray:[Promise<NodeInfo>] = Array()
//                for i in 0..<nodelist.count{
//                    torusIndexes.append(BigInt(i+1))
//                    getNodeInfoPromisesArray.append(self.getNodeEndpointPromise(nodeEthAddress: nodelist[i]))
//                }
//                return when(resolved: getNodeInfoPromisesArray)
//            }.done{ results in
//                var updatedEndpoints: Array<String> = Array()
//                var updatedNodePub:Array<TorusNodePub> = Array()
//
//                for result in results{
//                    switch result {
//                    case .fulfilled(let value):
//                        let endPointElement:NodeInfo = value;
//                        let endpoint = "https://" + endPointElement.getDeclaredIp().split(separator: ":")[0] + "/jrpc";
//                        updatedEndpoints.append(endpoint)
//
//                        let hexPubX = endPointElement.getPubKx()
//                        let hexPubY = endPointElement.getPubKy()
//                        updatedNodePub.append(TorusNodePub(_X: hexPubX, _Y: hexPubY))
//                    default:
//                        seal.reject("error with node info")
//                    }
//
//                }
//
//                self.nodeDetails = NodeDetails(_currentEpoch: "\(currentEpoch)", _nodeListAddress: self.proxyAddress.address, _torusNodeEndpoints: updatedEndpoints, _torusIndexes: torusIndexes, _torusNodePub: updatedNodePub, _updated: true)
//
//                seal.fulfill(self.nodeDetails!)
//            }.catch { error in
//                //print(error)
//                seal.reject("get epoch info failed")
//            }
//        }
//
//        return returnPromise
//    }
//
}
