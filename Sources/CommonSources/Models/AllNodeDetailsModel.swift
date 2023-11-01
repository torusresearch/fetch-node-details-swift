import Foundation
import BigInt

public struct AllNodeDetailsModel:Equatable, Decodable {
    public static func == (lhs : AllNodeDetailsModel, rhs : AllNodeDetailsModel) -> Bool {
        return lhs.currentEpoch == rhs.currentEpoch && lhs.torusNodeEndpoints == rhs.torusNodeEndpoints && lhs.torusNodePub == rhs.torusNodePub && lhs.currentEpoch == rhs.currentEpoch && lhs.torusIndexes == rhs.torusIndexes && lhs.updated == rhs.updated
    }
    
    public var currentEpoch : String
    public var torusNodeEndpoints : Array<String>
    public var torusNodeSSSEndpoints : Array<String>
    public var torusNodeRSSEndpoints : Array<String>
    public var torusNodeTSSEndpoints : Array<String>
    public var torusIndexes : Array<BigUInt>
    public var torusNodePub : Array<TorusNodePubModel>
    public var updated = false
    
    public enum CodingKeys: String, CodingKey {
            case currentEpoch = "currentEpoch"
            case torusNodeEndpoints = "torusNodeEndpoints"
            case torusNodeSSSEndpoints = "torusNodeSSSEndpoints"
            case torusNodeRSSEndpoints = "torusNodeRSSEndpoints"
            case torusNodeTSSEndpoints = "torusNodeTSSEndpoints"
            case torusIndexes = "torusIndexes"
            case torusNodePub = "torusNodePub"
            case updated = "updated"
        }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        currentEpoch = try container.decode(String.self, forKey: .currentEpoch)
        torusNodeEndpoints = try container.decode([String].self, forKey: .torusNodeEndpoints)
        torusNodeSSSEndpoints = try container.decodeIfPresent([String].self, forKey: .torusNodeSSSEndpoints) ?? []
        torusNodeRSSEndpoints = try container.decodeIfPresent([String].self, forKey: .torusNodeRSSEndpoints) ?? []
        torusNodeTSSEndpoints = try container.decodeIfPresent([String].self, forKey: .torusNodeTSSEndpoints) ?? []
        // Decode torusIndexes as [Int]
        let torusIndexesInt = try container.decode([Int].self, forKey: .torusIndexes)

        // Convert [Int] to Array<BigUInt>
        torusIndexes = torusIndexesInt.map { BigUInt($0) }
        torusNodePub = try container.decode([TorusNodePubModel].self, forKey: .torusNodePub)
        updated = try container.decodeIfPresent(Bool.self, forKey: .updated) ?? false
    }
    
    public init(_currentEpoch : String, _torusNodeEndpoints : Array<String>, _torusNodeSSSEndpoints : Array<String> = [], _torusNodeRSSEndpoints : Array<String> = [], _torusNodeTSSEndpoints : Array<String> = [],  _torusIndexes : Array<BigUInt>, _torusNodePub : Array<TorusNodePubModel>, _updated : Bool = false) {
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
    
    public mutating func getCurrentEpoch() -> String{
        return currentEpoch
    }
    
    public mutating func setCurrentEpoch( currentEpoch : String) {
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
    
    public mutating func setNodeDetails(nodeDetails: AllNodeDetailsModel, updated: Bool) {
        self.torusNodeEndpoints = nodeDetails.torusNodeEndpoints
        self.torusNodeSSSEndpoints = nodeDetails.torusNodeSSSEndpoints
        self.torusNodeRSSEndpoints = nodeDetails.torusNodeRSSEndpoints
        self.torusNodeTSSEndpoints = nodeDetails.torusNodeTSSEndpoints
        self.torusNodePub = nodeDetails.torusNodePub
        self.torusIndexes = nodeDetails.torusIndexes
        self.currentEpoch = nodeDetails.currentEpoch
        self.updated = updated
    }
}
