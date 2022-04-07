//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 04/04/22.
//

import Foundation
import web3
import BigInt


public struct AllNodeDetailsModel:Equatable {
    public static func == (lhs: AllNodeDetailsModel, rhs: AllNodeDetailsModel) -> Bool {
        return lhs.currentEpoch == rhs.currentEpoch && lhs.torusNodeEndpoints == rhs.torusNodeEndpoints && lhs.torusNodePub == rhs.torusNodePub && lhs.currentEpoch == rhs.currentEpoch && lhs.torusIndexes == rhs.torusIndexes && lhs.updated == rhs.updated
    }
    
    private var currentEpoch : BigUInt
    private var nodeListAddress : String
    private var torusNodeEndpoints : Array<String>
    private var torusIndexes : Array<BigUInt>
    private var torusNodePub : Array<TorusNodePubModel>
    private var updated = false
    
    public init(_currentEpoch : BigUInt, _nodeListAddress : String, _torusNodeEndpoints : Array<String>,  _torusIndexes : Array<BigUInt>, _torusNodePub : Array<TorusNodePubModel>, _updated : Bool) {
        self.currentEpoch = _currentEpoch;
        self.nodeListAddress = _nodeListAddress;
        self.torusNodeEndpoints = _torusNodeEndpoints;
        self.torusIndexes = _torusIndexes;
        self.torusNodePub = _torusNodePub;
        self.updated = _updated;
    }
    
    public func getTorusIndexes() -> Array<BigUInt> {
        return self.torusIndexes;
    }
    
    public mutating func setTorusIndexes(torusIndexes : Array<BigUInt>){
        self.torusIndexes = torusIndexes
    }
    
    public func getUpdated() -> Bool {
        return updated
    }
    
    public mutating func setUpdated(updated : Bool){
        self.updated = updated
    }
    
    public mutating func getCurrentEpoch() -> BigUInt{
        return currentEpoch
    }
    
    public mutating func setCurrentEpoch( currentEpoch : BigUInt) {
        self.currentEpoch = currentEpoch;
    }
    
    public func getNodeListAddress() -> String {
        return nodeListAddress
    }
    
    public mutating func setNodeListAddress(nodeListAddress : String) {
        self.nodeListAddress = nodeListAddress
    }
    
    public func getTorusNodeEndpoints() ->  Array<String> {
        return torusNodeEndpoints
    }
    
    public mutating func setTorusNodeEndpoints(torusNodeEndpoints : Array<String>) {
        self.torusNodeEndpoints = torusNodeEndpoints
    }
    
    public func getTorusNodePub() -> Array<TorusNodePubModel> {
        return torusNodePub
    }
    
    public mutating func setTorusNodePub(torusNodePub : Array<TorusNodePubModel>) {
        self.torusNodePub = torusNodePub
    }
}
