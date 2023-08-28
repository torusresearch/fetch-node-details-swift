import Foundation
public struct TorusNodePubModel:Equatable, Codable {
    
    public static func == (lhs: TorusNodePubModel, rhs: TorusNodePubModel) -> Bool {
        return lhs.X == rhs.X && lhs.Y == rhs.Y
    }
    
    public let X : String;
    public let Y : String;
    
    public init(_X : String, _Y : String) {
        self.X = _X
        self.Y = _Y
    }
    
    public func getX() -> String {
        return X
    }
    
    public func getY() -> String {
        return Y
    }
}
