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

    private var network: TORUS_NETWORK_TYPE = TORUS_NETWORK["MAINNET"]!

    private var urlSession: URLSession
    private var updated = false
    var nodeDetails: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusNodeSSSEndpoints: torusNodeSSSEndpoints, _torusNodeRSSEndpoints: torusNodeRSSEndpoints, _torusNodeTSSEndpoints:torusNodeTSSEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }


    public init(network: TORUS_NETWORK_TYPE, fndEndpoint: String? = nil, logLevel: OSLogType = .default, urlSession: URLSession = URLSession.shared) {
        fndLogType = logLevel // to be used across application
        self.network = network
        self.urlSession = urlSession
        if let endpoint = fndEndpoint, !endpoint.isEmpty {
            self.fndServerEndpoint = endpoint
        }
    }
    
    func getNodeDetails(verifier: String, verifierId: String) async throws -> AllNodeDetailsModel {
        do {
            // TODO: make a constant and check MULTI_CLUSTER_NETWORKS includes self.network

            if updated && !MULTI_CLUSTER_NETWORKS.contains(self.network) {
                return nodeDetails
            }
            // TODO: try1 : get AllNodeDetailsModel from `${this.fndServerEndpoint}?network=${this.network}&verifier=${verifier}&verifierId=${verifierId}`
            // TODO: try2 : fetchLocalConfig from fnd-base
            do {
                let url = URL(string: "\(fndServerEndpoint)?network=\(network)&verifier=\(verifier)&verifierId=\(verifierId)")!
                let (data, _) = try await URLSession.shared.data(from: url)
                let response = try JSONDecoder().decode(NodeDetailsResponse.self, from: data)
                setNodeDetails(response.nodeDetails)
                
                return nodeDetails
            } catch {
                log.error("Failed to fetch node details from server, using local.", error)
            }
            
            guard let nodeDetails = fetchLocalConfig(self.network) else {
                throw Error("Failed to fetch node details")
            }
            setNodeDetails(nodeDetails)
            
            return nodeDetails
        } catch {
            log.error("Failed to fetch node details", error)
            throw error
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
