import Foundation

// Used in error thrown from guard let
extension String: LocalizedError {
    public var errorDescription: String? { return self }
}
