import BigInt
import Foundation
import OSLog
import web3
import CommonSources
import FndBase
// Global variable
var fndLogType = OSLogType.default

open class NodeDetailManager {
    
    private var fndServerEndpoint = "https://fnd.tor.us/node-details"
    private var currentEpoch: String = "0"
    private var torusNodeEndpoints = [String]()
    private var torusNodePub: [TorusNodePubModel] = []
    private var torusIndexes: [BigUInt] = []
    private var torusNodeSSSEndpoints: [String] = []
    private var torusNodeRSSEndpoints: [String] = []
    private var torusNodeTSSEndpoints: [String] = []

    private var network: TorusNetwork = .sapphire( SapphireNetwork.SAPPHIRE_MAINNET ) 

    private var urlSession: URLSession
    private var updated = false
    var nodeDetails: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusNodeSSSEndpoints: torusNodeSSSEndpoints, _torusNodeRSSEndpoints: torusNodeRSSEndpoints, _torusNodeTSSEndpoints:torusNodeTSSEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }


    public init(network: TorusNetwork, fndEndpoint: String? = nil, logLevel: OSLogType = .default, urlSession: URLSession = URLSession.shared) {
        fndLogType = logLevel // to be used across application
        self.network = network
        self.urlSession = urlSession
        if let endpoint = fndEndpoint, !endpoint.isEmpty {
            self.fndServerEndpoint = endpoint
        }
    }
    
    public func getNodeDetails(verifier: String, verifierID: String) async throws -> AllNodeDetailsModel {
        
        switch network {
        case .legacy(let legacyNetwork):
            if updated && !MULTI_CLUSTER_NETWORKS.contains(legacyNetwork) {
                return nodeDetails
            }
        case .sapphire(_):
            break
        }
    
        
        var fndResult: AllNodeDetailsModel
        fndResult = nodeDetails
        
        do {
            guard let url = URL(string: "\(fndServerEndpoint)?network=\(network.name)&verifier=\(verifier)&verifierId=\(verifierID)") else {
                fatalError("Invalid URL ")
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(NodeDetailsResponse.self, from: data)
            let nodeDetails = response.getNodeDetails()
            fndResult.setNodeDetails(nodeDetails: nodeDetails)
            return fndResult
        } catch let error {
            os_log("Failed to fetch node details from server, using local. %s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, error.localizedDescription)
        }
        let nodeDetails = try fetchLocalConfig(network: self.network)!
        fndResult.setNodeDetails(nodeDetails: nodeDetails)
        return fndResult
    }
    
    // setNodeDetails is defined in AllNodeDetailsModel because of accessibility of variables
}

extension NodeDetailManager {
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
