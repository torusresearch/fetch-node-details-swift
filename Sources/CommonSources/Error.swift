import Foundation

public enum FetchNodeError : Error {
    case InvalidURL
    case InvalidInput
    case GeneralError(String)
    case InvalidNetwork(String)
    case InvalidMigrationNetwork(String)
}
