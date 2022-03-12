//
//  nodeInfo.swift
//  
//
//  Created by Shubham on 13/3/20.
//

import Foundation
import web3
import BigInt

/// NodeDetails are information about individual node. Each node has a public key, IP and listener addresses.
/// This stuct is used for decoding purpoes. 
public struct NodeDetails: ABITuple {
    public var encodableValues: [ABIType] {[declaredIp, position, pubKx, pubKy, tmP2PListenAddress, p2pListenAddress]}
    public static var types: [ABIType.Type] { [String.self, BigUInt.self, BigUInt.self, BigUInt.self, String.self, String.self] }
    
    var declaredIp: String;
    var position: BigUInt;
    var pubKx: BigUInt;
    var pubKy: BigUInt;
    var tmP2PListenAddress: String;
    var p2pListenAddress: String;

    init( declaredIp: String,
          position: BigUInt,
          pubKx: BigUInt,
          pubKy: BigUInt,
          tmP2PListenAddress: String,
          p2pListenAddress: String) {
        self.declaredIp = declaredIp
        self.position = position
        self.pubKx = pubKx
        self.pubKy = pubKy
        self.tmP2PListenAddress = tmP2PListenAddress
        self.p2pListenAddress = p2pListenAddress
    }
    
    public init?(values: [ABIDecoder.DecodedValue]) throws {
        self.declaredIp = try values[0].decoded()
        self.position = try values[1].decoded()
        self.pubKx = try values[2].decoded()
        self.pubKy = try values[3].decoded()
        self.tmP2PListenAddress = try values[4].decoded()
        self.p2pListenAddress = try values[5].decoded()
    }
    
    public func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(declaredIp)
        try encoder.encode(position)
        try encoder.encode(pubKx)
        try encoder.encode(pubKy)
        try encoder.encode(tmP2PListenAddress)
        try encoder.encode(p2pListenAddress)
    }
    
    public func getDeclaredIp() -> String {
        return declaredIp;
    }
    
    public func getP2pListenAddress() -> String {
        return p2pListenAddress;
    }
    
    public func getPosition() -> BigUInt {
        return position;
    }
    
    public func getPubKx() -> BigUInt {
        return pubKx;
    }
    
    public func getPubKy() -> BigUInt {
        return pubKy;
    }
    
    public func getTmP2PListenAddress() -> String {
        return tmP2PListenAddress;
    }
}

