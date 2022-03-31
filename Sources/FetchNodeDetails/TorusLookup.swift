//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 31/03/22.
//

import Foundation
import web3
import BigInt

extension NodeListProxyContract{
    public struct getNodeSet: ABIFunction {
        public static var name: String = "getNodeSet"
        public var gasPrice: BigUInt?
        public var gasLimit: BigUInt?
        public var from: EthereumAddress?
        public var verifier: String
        public var hashedVerifierId: String
        public var contract: EthereumAddress
        
        public init(contract: EthereumAddress,verifier:String,hashedVerifierId:String) {
            self.contract = contract
            self.verifier = verifier
            self.hashedVerifierId = hashedVerifierId
        }
        
        public func encode(to encoder: ABIFunctionEncoder) throws {
            try encoder.encode(verifier)
            try encoder.encode(hashedVerifierId)
        }
        
    }

}

/// This class is keeps details of all the nodes.
/// torusNodeEndpoints are used in torus-utils to retrieveShares.

open class getNodeSetStruct:Equatable,ABITuple {
    public var encodableValues: [ABIType] { [currentEpoch, ABIArray(values: torusNodeEndpoints) , ABIArray(values: torusNodePubX) ,ABIArray(values: torusNodePubY) , ABIArray(values: torusIndexes) ] }
    
    public static var types: [ABIType.Type] { [String.self, ABIArray<String>.self,ABIArray<BigUInt>.self, ABIArray<BigUInt>.self, ABIArray<BigUInt>.self] }
    
    public required init?(values: [ABIDecoder.DecodedValue]) throws {
        self.currentEpoch = try values[0].decoded()
        self.torusNodeEndpoints = try values.dropLast(3).dropFirst(1).map{try $0.decoded() }
        self.torusNodePubX = try values.dropLast(2).dropFirst(4).map{try $0.decoded() }
        self.torusNodePubY = try values.dropLast(1).dropFirst(5).map{try $0.decoded() }
        self.torusIndexes = try values.dropLast(0).dropFirst(3).map{try $0.decoded()}

    }
    

    
    public func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(currentEpoch)
        try encoder.encode(torusNodeEndpoints)
        try encoder.encode(torusNodePubX)
        try encoder.encode(torusNodePubY)
        try encoder.encode(torusIndexes)
    }
    
   
    

    
    public static func == (lhs: getNodeSetStruct, rhs: getNodeSetStruct) -> Bool {
        return lhs.torusNodeEndpoints == rhs.torusNodeEndpoints
    }
    
    
    
    
     var currentEpoch : String
     var torusNodeEndpoints : Array<String>
     var torusIndexes : Array<BigInt>
     var torusNodePubX : Array<BigInt>
     var torusNodePubY : Array<BigInt>
    
    
    // Not currently in use
    public init(_currentEpoch : String, _torusNodeEndpoints : Array<String>,  _torusIndexes : Array<BigInt>, _torusNodePubX : Array<BigInt>, _torusNodePubY:Array<BigInt>) {
        self.currentEpoch = _currentEpoch;
        self.torusNodeEndpoints = _torusNodeEndpoints;
        self.torusIndexes = _torusIndexes;
        self.torusNodePubX = _torusNodePubX
        self.torusNodePubY = _torusNodePubY
        
    }

    public func getTorusIndexes() -> Array<BigInt> {
        return self.torusIndexes
    }

    public func setTorusIndexes(torusIndexes : Array<BigInt>){
        self.torusIndexes = torusIndexes;
    }


    public func getCurrentEpoch() -> String{
        return currentEpoch
    }

    public func setCurrentEpoch( currentEpoch : String) {
        self.currentEpoch = currentEpoch;
    }


    public func getTorusNodeEndpoints() ->  Array<String> {
        return torusNodeEndpoints
    }

    public func setTorusNodeEndpoints(torusNodeEndpoints : Array<String>) {
        self.torusNodeEndpoints = torusNodeEndpoints;
    }

  

    
}
