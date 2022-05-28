import BigInt
import Foundation
import OSLog
import PromiseKit
import web3

extension FetchNodeDetails {
    public func getNodeDetails(skip: Bool = false, verifier: String, verifierID: String) -> Promise<AllNodeDetailsModel> {
        let (tempPromise, seal) = Promise<AllNodeDetailsModel>.pending()
        if skip && network == .MAINNET {
            seal.fulfill(nodeDetails)
            return tempPromise
        }
        if updated && network == .MAINNET {
            seal.fulfill(nodeDetails)
            return tempPromise
        }
        let hashVerifierID = verifierID.web3.keccak256
        let function = TorusLookupContract.getNodeSet(contract: proxyAddress, verifier: verifier, hashVerifierID: hashVerifierID)
        guard let transcation = try? function.transaction() else {
            os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.transactionEncodingFailed.debugDescription)
            seal.reject(FNDError.transactionEncodingFailed)
            return tempPromise
        }
        client.eth_call(transcation, block: .Latest) { [unowned self] _, info in
            do {
                if let info = info {
                    guard let decodedTuple = try decodeNodeData(info: info)
                    else {
                        seal.reject(FNDError.decodingFailed)
                        return
                    }
                    let updatedCurrentEpoch = decodedTuple.currentEpoch
                    let updatedTorusIndexes = decodedTuple.torusIndexes
                    var updatedEndPoints = [String]()
                    var updatedNodePub = [TorusNodePubModel]()
                    for i in 0 ... updatedTorusIndexes.count - 1 {
                        let pubX = decodedTuple.torusNodePubX[i]
                        let pubY = decodedTuple.torusNodePubY[i]
                        let endPointElement = decodedTuple.torusNodeEndpoints[i]
                        let endPoint = "https://\(endPointElement.split(separator: ":")[0])/jrpc"
                        updatedEndPoints.append(endPoint)
                        updatedNodePub.append(.init(_X: pubX.web3.hexString.replacingOccurrences(of: "0x", with: ""), _Y: pubY.web3.hexString.replacingOccurrences(of: "0x", with: "")))
                    }
                    self.currentEpoch = updatedCurrentEpoch
                    self.torusNodeEndpoints = updatedEndPoints
                    self.torusNodePub = updatedNodePub
                    self.torusIndexes = updatedTorusIndexes
                    self.updated = true
                    os_log("nodeDetails is: %@", log: getTorusLogger(log: FNDLogger.core, type: .info), type: .info, "\(self.nodeDetails)")
                    seal.fulfill(self.nodeDetails)
                } else {
                    os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.infoFailed.debugDescription)
                    seal.reject(FNDError.infoFailed)
                    return
                }
            } catch {
                if self.network == .MAINNET {
                    seal.fulfill(nodeDetails)
                } else {
                    os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.decodingFailed.debugDescription)
                    seal.reject(FNDError.decodingFailed)
                }
            }
        }
        return tempPromise
    }
}

extension FetchNodeDetails {
    public func decodeNodeData(info: String) throws -> GetNodeSetModel? {
        let decodedData = try ABIDecoder.decodeData(info, types: [BigInt.self, ABIArray<String>.self, ABIArray<BigUInt>.self, ABIArray<BigUInt>.self, ABIArray<BigUInt>.self])
        let currentEpoch: BigUInt = try decodedData[0].decoded()
        let nodeEndpoints: [String] = try decodedData[1].decodedArray()
        let pubx: [BigUInt] = try decodedData[2].decodedArray()
        let puby: [BigUInt] = try decodedData[3].decodedArray()
        let indexes: [BigUInt] = try decodedData[4].decodedArray()
        let val: GetNodeSetModel = .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: nodeEndpoints, _torusIndexes: indexes, _torusNodePubX: pubx, _torusNodePubY: puby)
        return val
    }
}
