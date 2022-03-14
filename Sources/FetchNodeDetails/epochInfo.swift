//
//  epochInfo.swift
//  
//
//  Created by Shubham on 13/3/20.
//

import Foundation
import web3
import BigInt

public struct EpochInfo: ABITuple {
    
    public static var types: [ABIType.Type] { [BigUInt.self, BigUInt.self, BigUInt.self, BigUInt.self, ABIArray<EthereumAddress>.self, BigUInt.self, BigUInt.self] }
    
    var id: BigUInt
    var n: BigUInt
    var k: BigUInt
    var t: BigUInt
    var nodeList: [EthereumAddress]
    var prevEpoch: BigUInt
    var nextEpoch: BigUInt
    
    init(id: BigUInt,
         n: BigUInt,
         k: BigUInt,
         t: BigUInt,
         nodeList: [EthereumAddress],
         prevEpoch: BigUInt,
         nextEpoch: BigUInt) {
        self.id =  id
        self.n = n
        self.k = k
        self.t = t
        self.nodeList = nodeList
        self.prevEpoch = prevEpoch
        self.nextEpoch = nextEpoch
    }
    
    public init?(values: [ABIDecoder.DecodedValue]) throws {
        self.nodeList = try values.dropLast(2).dropFirst(4).map{try $0.decoded() }
        
        self.id = try values[0].decoded()
        self.n = try values[1].decoded()
        self.k = try values[2].decoded()
        self.t = try values[3].decoded()
        self.prevEpoch = try values[values.count-2].decoded()
        self.nextEpoch = try values[values.count-1].decoded()
        
    }
    
    public func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(id)
        try encoder.encode(n)
        try encoder.encode(k)
        try encoder.encode(t)
        try encoder.encode(nodeList)
        try encoder.encode(prevEpoch)
        try encoder.encode(nextEpoch)
    }
    
    public var encodableValues: [ABIType] { [id, n, k, t, ABIArray(values: nodeList), prevEpoch, nextEpoch] }
    
    public func getId() -> BigUInt {
        return self.id;
    }

    public func getK() -> BigUInt{
        return self.k;
    }

    public func getN() -> BigUInt{
        return self.n;
    }

    public func getNextEpoch() -> BigUInt{
        return self.nextEpoch;
    }

    public func getPrevEpoch() -> BigUInt{
        return self.prevEpoch;
    }

    public func getT() -> BigUInt{
        return self.t;
    }

    public func getNodeList() -> [EthereumAddress] {
        return self.nodeList;
    }
}
