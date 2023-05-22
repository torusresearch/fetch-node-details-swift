import Foundation
import BigInt

public struct AllNodeDetailsModel:Equatable {
    public static func == (lhs : AllNodeDetailsModel, rhs : AllNodeDetailsModel) -> Bool {
        return lhs.currentEpoch == rhs.currentEpoch && lhs.torusNodeEndpoints == rhs.torusNodeEndpoints && lhs.torusNodePub == rhs.torusNodePub && lhs.currentEpoch == rhs.currentEpoch && lhs.torusIndexes == rhs.torusIndexes && lhs.updated == rhs.updated
    }
    
    private var currentEpoch : BigUInt
    private var torusNodeEndpoints : Array<String>
    private var torusNodeSSSEndpoints : Array<String>
    private var torusNodeRSSEndpoints : Array<String>
    private var torusNodeTSSEndpoints : Array<String>
    private var torusIndexes : Array<BigUInt>
    private var torusNodePub : Array<TorusNodePubModel>
    private var updated = false
    
    public init(_currentEpoch : BigUInt, _torusNodeEndpoints : Array<String>, _torusNodeSSSEndpoints : Array<String>, _torusNodeRSSEndpoints : Array<String>, _torusNodeTSSEndpoints : Array<String>,  _torusIndexes : Array<BigUInt>, _torusNodePub : Array<TorusNodePubModel>, _updated : Bool) {
        self.currentEpoch = _currentEpoch;
        self.torusNodeSSSEndpoints = _torusNodeSSSEndpoints;
        self.torusNodeRSSEndpoints = _torusNodeRSSEndpoints;
        self.torusNodeTSSEndpoints = _torusNodeTSSEndpoints;
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
    
    public func getTorusNodeSSSEndpoints() ->  Array<String> {
        return torusNodeSSSEndpoints
    }
    
    public mutating func setTorusNodeSSSEndpoints(torusNodeSSSEndpoints : Array<String>) {
        self.torusNodeSSSEndpoints = torusNodeSSSEndpoints
    }
    
    public func getTorusNodeRSSEndpoints() ->  Array<String> {
        return torusNodeRSSEndpoints
    }
    
    public mutating func setTorusNodeRSSEndpoints(torusNodeRSSEndpoints : Array<String>) {
        self.torusNodeRSSEndpoints = torusNodeRSSEndpoints
    }
    
    public func getTorusNodeTSSEndpoints() ->  Array<String> {
        return torusNodeTSSEndpoints
    }
    
    public mutating func setTorusNodeTSSEndpoints(torusNodeTSSEndpoints : Array<String>) {
        self.torusNodeTSSEndpoints = torusNodeTSSEndpoints
    }
    
    public mutating func setNodeDetails(nodeDetails: AllNodeDetailsModel) {
        let currentEpoch = nodeDetails.currentEpoch
        let torusNodeEndpoints = nodeDetails.torusNodeEndpoints
        let torusNodeSSSEndpoints = nodeDetails.torusNodeSSSEndpoints
        let torusNodeRSSEndpoints = nodeDetails.torusNodeRSSEndpoints
        let torusNodeTSSEndpoints = nodeDetails.torusNodeTSSEndpoints
        let torusNodePub = nodeDetails.torusNodePub
        let torusIndexes = nodeDetails.torusIndexes

        self.torusNodeEndpoints = torusNodeEndpoints
        self.torusNodeSSSEndpoints = torusNodeSSSEndpoints
        self.torusNodeRSSEndpoints = torusNodeRSSEndpoints
        self.torusNodeTSSEndpoints = torusNodeTSSEndpoints
        self.torusNodePub = torusNodePub
        self.torusIndexes = torusIndexes
        self.currentEpoch = currentEpoch
        self.updated = true
    }
}
