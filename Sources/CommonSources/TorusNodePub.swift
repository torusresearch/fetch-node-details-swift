import Foundation
public class TorusNodePub: Equatable, Codable {
    public static func == (lhs: TorusNodePub, rhs: TorusNodePub) -> Bool {
        return lhs.X == rhs.X && lhs.Y == rhs.Y
    }

    public let X: String
    public let Y: String

    public init(_X: String, _Y: String) {
        X = _X
        Y = _Y
    }

    public func getX() -> String {
        return X
    }

    public func getY() -> String {
        return Y
    }
}
