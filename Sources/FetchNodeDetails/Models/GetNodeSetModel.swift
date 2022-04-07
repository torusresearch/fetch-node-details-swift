//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 01/04/22.
//

import Foundation
import web3
import BigInt


public struct GetNodeSetModel {
    
    var currentEpoch : BigUInt
    var torusNodeEndpoints : [String]
    var torusNodePubX :[BigUInt]
    var torusNodePubY : [BigUInt]
    var torusIndexes : [BigUInt]
    
    
    public init(_currentEpoch : BigUInt, _torusNodeEndpoints : Array<String>,  _torusIndexes : Array<BigUInt>, _torusNodePubX : Array<BigUInt>, _torusNodePubY:Array<BigUInt>) {
        self.currentEpoch = _currentEpoch;
        self.torusNodeEndpoints = _torusNodeEndpoints;
        self.torusIndexes = _torusIndexes;
        self.torusNodePubX = _torusNodePubX
        self.torusNodePubY = _torusNodePubY
        
    }
    
    
    public static func == (lhs: GetNodeSetModel, rhs: GetNodeSetModel) -> Bool {
        return lhs.torusNodeEndpoints == rhs.torusNodeEndpoints
    }
    
    
}

