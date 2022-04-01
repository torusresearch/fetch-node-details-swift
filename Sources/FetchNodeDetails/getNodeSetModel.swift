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
import OSLog

open class getNodeSetModel:Equatable,ABITuple {
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
    
   
    

    
    public static func == (lhs: getNodeSetModel, rhs: getNodeSetModel) -> Bool {
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

