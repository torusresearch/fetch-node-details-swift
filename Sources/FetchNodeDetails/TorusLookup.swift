//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 01/04/22.
//

import Foundation
import web3
import BigInt
import PromiseKit

public enum TorusLookupContract{
    
    public struct getNodeSet:ABIFunction{
        public static var name: String = "getNodeSet"
        
        public var gasPrice: BigUInt?
        
        public var gasLimit: BigUInt?
        
        public var contract: EthereumAddress
        
        public var from: EthereumAddress?
        
        public var verifier:String
        public var verfierID:[UInt8]
        
        public init(contract:EthereumAddress,verifier:String,veriferID:[UInt8]){
            self.contract = contract
            self.verifier = verifier
            self.verfierID = veriferID
        }
        
        public func encode(to encoder: ABIFunctionEncoder) throws {
            try encoder.encode(verifier)
            try encoder.encode(verfierID)
        }
        
    }
    
}

