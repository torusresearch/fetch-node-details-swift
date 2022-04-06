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
import OSLog
@testable import web3

extension FetchNodeDetails {
    
    public func getAllNodes(skip:Bool = false,verifier:String,verifierID:String) -> Promise<AllNodeDetailsModel>{
        let (tempPromise,seal) = Promise<AllNodeDetailsModel>.pending()
     
        if skip && self.network == .MAINNET{
            seal.fulfill(SampleOutputMainet.init(proxyAddress: self.proxyAddress.value).val)
            return tempPromise
        }
        if self.updated && self.network == .MAINNET{
            seal.fulfill(SampleOutputMainet.init(proxyAddress: self.proxyAddress.value).val)
            return tempPromise
        }
        let hashVerifierID = verifierID.web3.keccak256
        let function = TorusLookupContract.getNodeSet(contract: self.proxyAddress, verifier: verifier, hashVeriferID: hashVerifierID)
        guard let transcation = try? function.transaction() else{
            os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.transactionEncodingFailed.debugDescription)
            seal.reject(FNDError.transactionEncodingFailed)
            return tempPromise
        }
        
        client.eth_call(transcation, block: .Latest) {[unowned self] error, info in
            do{
            if let info = info {
                guard let decodedTuple = try decodeNodeData(info: info)
                 else {
                    seal.reject(FNDError.decodingFailed)
                    return
                }
                let currentEpoch = decodedTuple.currentEpoch
                var updatedEndPoints = [String]()
                var updatedNodePub = [TorusNodePub]()
                for i in 0...decodedTuple.torusIndexes.count - 1{
                    let pubX = decodedTuple.torusNodePubX[i]
                    let pubY = decodedTuple.torusNodePubY[i]
                    let endPointElement = decodedTuple.torusNodeEndpoints[i]
                    let endPoint = "https://\(endPointElement.split(separator:":")[0])/jrpc"
                    updatedEndPoints.append(endPoint)
                    updatedNodePub.append(.init(_X: pubX.web3.hexString.replacingOccurrences(of: "0x", with: ""), _Y: pubY.web3.hexString.replacingOccurrences(of: "0x", with: "")))
                }
                self.updated = true
                
                let val =  AllNodeDetailsModel(_currentEpoch: currentEpoch, _nodeListAddress: self.proxyAddress.value, _torusNodeEndpoints: updatedEndPoints, _torusIndexes: decodedTuple.torusIndexes, _torusNodePub: updatedNodePub, _updated: self.updated)
                os_log("nodeDetails is: %@", log: getTorusLogger(log: FNDLogger.core, type: .info), type: .info, "\(val)")
                seal.fulfill(val)
            }
            else{
                os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.infoFailed.debugDescription)
                seal.reject(FNDError.infoFailed)
                return
            }
        }
        catch{
            if self.network == .MAINNET{
                seal.fulfill(SampleOutputMainet(proxyAddress: self.proxyAddress.value).val)
                }
                else{
                    os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.decodingFailed.debugDescription)
                    seal.reject(FNDError.decodingFailed)
                }
            }
        }
        return tempPromise
    }
    
    func decodeNodeData(info:String) throws -> GetNodeSetModel?{
      let decodedData = try ABIDecoder.decodeData(info, types: [BigInt.self, ABIArray<String>.self,ABIArray<BigUInt>.self,ABIArray<BigUInt>.self,ABIArray<BigUInt>.self])
        let currentEpoch:BigUInt = try decodedData[0].decoded()
            let nodeEndpoints:[String] = decodedData[1].entry.map{$0.web3.stringValue}
            let pubx:[BigUInt] = decodedData[2].entry.compactMap{BigUInt(hex: $0)}
            let puby:[BigUInt] = decodedData[3].entry.compactMap{BigUInt(hex: $0)}
            let indexes:[BigUInt] = decodedData[4].entry.compactMap{BigUInt(hex: $0)}
            let val:GetNodeSetModel = .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: nodeEndpoints, _torusIndexes: indexes, _torusNodePubX: pubx, _torusNodePubY: puby)
            return val
        }
    
        }
