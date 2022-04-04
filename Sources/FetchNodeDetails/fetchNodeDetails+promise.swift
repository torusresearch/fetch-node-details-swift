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

extension FetchNodeDetails {
    
    open func getAllNodes(skip:Bool = false,verifier:String,verifierID:String) -> Promise<AllNodeDetailsModel>{
        let (tempPromise,seal) = Promise<AllNodeDetailsModel>.pending()
        let hashVerifierID = verifierID.web3.keccak256
        let function = TorusLookupContract.getNodeSet(contract: self.proxyAddress, verifier: verifier, hashVeriferID: hashVerifierID)
        guard let transcation = try? function.transaction() else{
            seal.reject(FNDError.transactionEncodingFailed)
            return tempPromise
        }
                
        client.eth_call(transcation, block: .Latest) { error, info in
            if let info = info {
                print(info)
                let a = info.components(separatedBy: "0x")
                let b = "0x0000000000000000000000000000000000000000000000000000000000000020" + a[1]
                guard let decodedData = try? ABIDecoder.decodeData(b, types: [getNodeSetModel.self]),
                      let decodedTuple: getNodeSetModel = try? decodedData[0].decoded()
                 else {
                    seal.reject(FNDError.decodingFailed)
                    return
                }
                let currentEpoch = decodedTuple.currentEpoch
                var updatedEndPoints = [String]()
                var updatedNodePub = [TorusNodePub]()
                for i in 0...decodedTuple.torusNodeEndpoints.count - 1 {
                    let pubX = decodedTuple.torusNodePubX[i]
                    let pubY = decodedTuple.torusNodePubY[i]
                    let endPointElement = decodedTuple.torusNodeEndpoints[i]
                    let endPoint = "https://\(endPointElement.split(separator:":")[0])/jrpc"
                    updatedEndPoints.append(endPoint)
                    updatedNodePub.append(.init(_X: pubX.web3.hexString.replacingOccurrences(of: "0x", with: ""), _Y: pubY.web3.hexString.replacingOccurrences(of: "0x", with: "")))
                }
                
              let val =  AllNodeDetailsModel(_currentEpoch: currentEpoch, _nodeListAddress: self.proxyAddress.value, _torusNodeEndpoints: updatedEndPoints, _torusIndexes: decodedTuple.torusIndexes, _torusNodePub: updatedNodePub, _updated: true)
                seal.fulfill(val)
            }
            else{
                seal.reject(FNDError.infoFailed)
            }
        }
        return tempPromise
    }
}
