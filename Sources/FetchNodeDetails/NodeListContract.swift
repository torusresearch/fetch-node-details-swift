//
//  NodeListContract.swift.swift
//  
//
//  Created by Shubham on 27/7/21.
//

import Foundation
import web3
import BigInt


public enum NodeListProxyContract{
        
    public struct CurrentEpoch: ABIFunction {
        public static var name: String = "currentEpoch"
        
        public var gasPrice: BigUInt? = nil
        
        public var gasLimit: BigUInt? = nil
        
        public var contract: EthereumAddress
        
        public var from: EthereumAddress?
        
        public init(contract: EthereumAddress) {
            self.contract = contract
        }
        
        public func encode(to encoder: ABIFunctionEncoder) throws {
            
        }
        
    }
    
    public struct getEpochInfo: ABIFunction {
        public static var name: String = "getEpochInfo"
        
        public var gasPrice: BigUInt?
        
        public var gasLimit: BigUInt?
        
        public var contract: EthereumAddress
        
        public var from: EthereumAddress?
        
        public var epoch: Int
        
        public init(contract: EthereumAddress, epoch: Int) {
            self.contract = contract
            self.epoch = epoch
        }
        
        public func encode(to encoder: ABIFunctionEncoder) throws {
            try encoder.encode(BigUInt(19))
        }
        
        
    }
}
