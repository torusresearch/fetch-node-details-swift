//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 01/04/22.
//

import Foundation
import web3
import BigInt


public struct getNodeSetModel:ABITuple {
    public var encodableValues: [ABIType] { [currentEpoch, ABIArray(values: torusNodeEndpoints) , ABIArray(values: torusNodePubX) ,ABIArray(values: torusNodePubY) , ABIArray(values: torusIndexes) ] }
    
    public static var types: [ABIType.Type] { [BigUInt.self, ABIArray<String>.self,ABIArray<BigUInt>.self, ABIArray<BigUInt>.self, ABIArray<BigUInt>.self] }
    
    
    var currentEpoch : BigUInt
    var torusNodeEndpoints : [String]
    var torusNodePubX :[BigUInt]
    var torusNodePubY : [BigUInt]
    var torusIndexes : [BigUInt]
    
    
    public init?(values: [ABIDecoder.DecodedValue]) throws {
        self.currentEpoch = try values[0].decoded()
        self.torusNodeEndpoints = try values.dropLast(3).dropFirst(1).map{try $0.decoded() }
        self.torusNodePubX = try values.dropLast(2).dropFirst(2).map{ try $0.decoded() }
        self.torusNodePubY = try values.dropLast(1).dropFirst(3).map{ try $0.decoded() }
        self.torusIndexes = try values.dropLast(0).dropFirst(4).map{ try $0.decoded()  }
    }
    
    public init(_currentEpoch : BigUInt, _torusNodeEndpoints : Array<String>,  _torusIndexes : Array<BigUInt>, _torusNodePubX : Array<BigUInt>, _torusNodePubY:Array<BigUInt>) {
        self.currentEpoch = _currentEpoch;
        self.torusNodeEndpoints = _torusNodeEndpoints;
        self.torusIndexes = _torusIndexes;
        self.torusNodePubX = _torusNodePubX
        self.torusNodePubY = _torusNodePubY
        
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
    
    
    
    
    
    
    
    
    
    
}

