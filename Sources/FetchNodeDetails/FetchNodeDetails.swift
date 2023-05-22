import BigInt
import Foundation
import OSLog
import web3

// Global variable
var fndLogType = OSLogType.default

open class FetchNodeDetails {
    public static var proxyAddressMainnet = "0xf20336e16B5182637f09821c27BDe29b0AFcfe80"
    public static var proxyAddressTestnet = "0xd084604e5FA387FbC2Da8bAab07fDD6aDED4614A"
    public static var proxyAddressCyan = "0x9f072ba19b3370e512aa1b4bfcdaf97283168005"
    public static var proxyAddressAqua = "0x29Dea82a0509153b91040ee13cDBba0f03efb625"
    public static var proxyAddressCeleste = "0x6Bffb4e89453069E7487f0fa5c9f4a2D771cce6c"
    
    
    private var fndServerEndpoint = "https://fnd.tor.us/node-details"
    private var currentEpoch: BigUInt = 0
    private var torusNodeEndpoints = [String]()
    private var torusNodePub: [TorusNodePubModel] = []
    private var torusIndexes: [BigUInt] = []
    private var torusNodeSSSEndpoints: [String] = []
    private var torusNodeRSSEndpoints: [String] = []
    private var torusNodeTSSEndpoints: [String] = []

//    private var client: EthereumClientProtocol
    private var network: EthereumNetworkFND = EthereumNetworkFND.MAINNET
//    private var proxyAddress: EthereumAddress
//    private var projectID: String = "7f287687b3d049e2bea7b64869ee30a3"
//    private let yourContractABI: String = contractABIString
    private var urlSession: URLSession
    private var updated = false
    var nodeDetails: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusNodeSSSEndpoints: torusNodeSSSEndpoints, _torusNodeRSSEndpoints: torusNodeRSSEndpoints, _torusNodeTSSEndpoints:torusNodeTSSEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }

    public init(network: EthereumNetworkFND = .MAINNET, fndEndpoint: String? = nil, logLevel: OSLogType = .default, urlSession: URLSession = URLSession.shared) {
        fndLogType = logLevel // to be used across application
        self.network = network
        self.urlSession = urlSession
        if let endpoint = fndEndpoint, !endpoint.isEmpty {
            self.fndServerEndpoint = endpoint
        }
    }

    public func getNodeDetails(verifier: String, verifierID: String) async throws -> AllNodeDetailsModel {
        if updated && (proxyAddress.value == FetchNodeDetails.proxyAddressMainnet || proxyAddress.value == FetchNodeDetails.proxyAddressTestnet) {
            return nodeDetails
        }
        let hashVerifierID = verifierID.web3.keccak256
        let function = TorusLookupContract.getNodeSet(contract: proxyAddress, verifier: verifier, hashVerifierID: hashVerifierID)
        guard let transcation = try? function.transaction() else {
            os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.transactionEncodingFailed.debugDescription)
            throw FNDError.transactionEncodingFailed
        }
        do {
            let info = try await client.eth_call(transcation, block: .Latest)

            guard let decodedTuple = try decodeNodeData(info: info)
            else {
                throw FNDError.decodingFailed
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
            currentEpoch = updatedCurrentEpoch
            torusNodeEndpoints = updatedEndPoints
            torusNodePub = updatedNodePub
            torusIndexes = updatedTorusIndexes
            updated = true
            os_log("nodeDetails is: %@", log: getTorusLogger(log: FNDLogger.core, type: .info), type: .info, "\(nodeDetails)")
            return nodeDetails
        } catch let error {
            os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, error.localizedDescription)
            if proxyAddress.value == FetchNodeDetails.proxyAddressMainnet {
                return FetchNodeDetails.nodeDetailsMainnet
            } else {
                os_log("%s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, FNDError.decodingFailed.debugDescription)
                throw error
            }
        }
    }
    
    // setNodeDetails is defined in AllNodeDetailsModel because of accessibility of variables
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
