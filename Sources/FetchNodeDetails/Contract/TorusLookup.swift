import BigInt
import Foundation
import PromiseKit
import web3

public enum TorusLookupContract {
    public struct getNodeSet: ABIFunction {
        public static var name: String = "getNodeSet"
        public var gasPrice: BigUInt?
        public var gasLimit: BigUInt?
        public var contract: EthereumAddress
        public var from: EthereumAddress?
        public var verifier: String
        public var hashedVerifierId: Data

        public init(contract: EthereumAddress, verifier: String, hashVerifierID: Data) {
            self.contract = contract
            self.verifier = verifier
            hashedVerifierId = hashVerifierID
        }

        public func encode(to encoder: ABIFunctionEncoder) throws {
            try encoder.encode(verifier)
            try encoder.encode(hashedVerifierId, staticSize: 32)
        }
    }
}
