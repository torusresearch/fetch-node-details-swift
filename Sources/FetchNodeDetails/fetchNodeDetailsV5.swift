//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 31/03/22.
//

import Foundation
import web3
import BigInt
import PromiseKit
import OSLog


extension FetchNodeDetails{
open func getNodeSet(verifier:String,hashedVerifeir:String) -> Promise<getNodeSetStruct> {
    let (tempPromise, seal) = Promise<getNodeSetStruct>.pending()

    let function = NodeListProxyContract.getNodeSet(contract: self.proxyAddress, verifier: verifier, hashedVerifierId: hashedVerifeir)
    guard let transaction = try? function.transaction() else{
        os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.transactionEncodingFailed.debugDescription)
        seal.reject(FNDError.transactionEncodingFailed);
        return tempPromise
    }
    
    client.eth_call(transaction, block: .Latest) { (error, info) in
        if let info = info {
            let a = info.components(separatedBy: "0x")
            let b = "0x0000000000000000000000000000000000000000000000000000000000000020" + a[1]
            
            guard let el = try? ABIDecoder.decodeData(b, types: [getNodeSetStruct.self]),
                  let decodedTuple: getNodeSetStruct = try? el[0].decoded() else {
                os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.decodingFailed.debugDescription)
                seal.reject(FNDError.decodingFailed)
                return
            }
            
            os_log("nodeDetails is: %@", log: getTorusLogger(log: FNDLogger.core, type: .info), type: .info, "\(decodedTuple)")
            seal.fulfill(decodedTuple)
        }else{
            os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.nodeDetailsFailed.debugDescription)
            seal.reject(FNDError.nodeDetailsFailed)
        }
    }
    
    return tempPromise
}
}
