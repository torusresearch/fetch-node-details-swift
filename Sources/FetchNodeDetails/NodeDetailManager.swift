import BigInt
import Foundation
import OSLog
// Global variable
var fndLogType = OSLogType.default

open class NodeDetailManager {
    private var fndServerEndpoint: String
    private var currentEpoch: String = "0"
    private var torusNodeEndpoints = [String]()
    private var torusNodePub: [TorusNodePub] = []
    private var torusIndexes: [BigUInt] = []
    private var torusNodeSSSEndpoints: [String] = []
    private var torusNodeRSSEndpoints: [String] = []
    private var torusNodeTSSEndpoints: [String] = []

    private var network: Web3AuthNetwork = .SAPPHIRE_MAINNET

    private var urlSession: URLSession
    private var updated = false
    var nodeDetails: NodeDetails {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusNodeSSSEndpoints: torusNodeSSSEndpoints, _torusNodeRSSEndpoints: torusNodeRSSEndpoints, _torusNodeTSSEndpoints: torusNodeTSSEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }

    public init(network: Web3AuthNetwork, fndEndpoint: String? = nil, logLevel: OSLogType = .default, urlSession: URLSession = URLSession.shared) {
        fndLogType = logLevel // to be used across application
        self.network = network
        self.urlSession = urlSession
        if let endpoint = fndEndpoint, !endpoint.isEmpty {
            fndServerEndpoint = endpoint
        } else {
            fndServerEndpoint = network.fndServer
        }
    }

    public func getNodeDetails(verifier: String, verifierID: String) async throws -> NodeDetails {
        switch network {
        case .AQUA, .CELESTE, .CYAN, .MAINNET, .TESTNET:
            if updated && !MULTI_CLUSTER_NETWORKS.contains(network) {
                return nodeDetails
            }
        case .SAPPHIRE_DEVNET, .SAPPHIRE_MAINNET:
            break
        }

        var fndResult: NodeDetails
        fndResult = nodeDetails

        do {
            guard let urlEncodedVerifier = verifier.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let urlEncodedVerifierID = verifierID.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
                  let urlEncodedNetwork = network.name.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
            else {
                throw FetchNodeError.InvalidInput
            }

            guard let url = URL(string: "\(fndServerEndpoint)?network=\(urlEncodedNetwork)&verifier=\(urlEncodedVerifier)&verifierId=\(urlEncodedVerifierID)") else {
                throw FetchNodeError.InvalidURL
            }
            let (data, _) = try await URLSession.shared.data(from: url)
            let response = try JSONDecoder().decode(NodeDetailsResponse.self, from: data)
            let nodeDetails = response.getNodeDetails()
            fndResult.setNodeDetails(nodeDetails: nodeDetails, updated: true)
            return fndResult
        } catch let error {
            os_log("Failed to fetch node details from server, using local. %s", log: getTorusLogger(log: FNDLogger.core, type: .error), type: .error, error.localizedDescription)
        }

        let nodeDetails = try fetchLocalConfig(network: network)
        fndResult.setNodeDetails(nodeDetails: nodeDetails, updated: false)
        return fndResult
    }

    public func getMetadataUrl() async throws -> String {
        return network.metadataMap
    }
}
