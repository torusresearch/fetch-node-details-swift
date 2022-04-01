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
    
    open func getAllNodes(skip:Bool = false,verifer:String,veriferID:String) -> Promise<getNodeSetModel>{
        let (tempPromise,seal) = Promise<getNodeSetModel>.pending()
        let hashVerifierID = veriferID.web3.keccak256
        let hashVeriferIDArr:[UInt8] = hashVerifierID.map{$0}
        let function = TorusLookupContract.getNodeSet(contract: self.proxyAddress, verifier: verifer, veriferID: hashVeriferIDArr)
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
                      let decodedTuple: getNodeSetModel = try? decodedData[0].decoded() else {
                    seal.reject(FNDError.decodingFailed)
                    return
                }
                seal.fulfill(decodedTuple)
            }
            else{
                seal.reject(FNDError.infoFailed)
            }
        }
        return tempPromise
    }
}
