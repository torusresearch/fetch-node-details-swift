import BigInt
import Foundation
import OSLog
import PromiseKit
import web3

// Global variable
var fndLogType = OSLogType.default

open class FetchNodeDetails {
    public static var proxyAddressMainnet = "0xf20336e16B5182637f09821c27BDe29b0AFcfe80"
    public static var proxyAddressRopsten = "0x6258c9d6c12ed3edda59a1a6527e469517744aa7"
    public static var proxyAddressPolygon = "0x9f072ba19b3370e512aa1b4bfcdaf97283168005"
    public static var nodeDetailsMainnet: AllNodeDetailsModel {
        return .init(_currentEpoch: 19, _nodeListAddress: proxyAddressMainnet, _torusNodeEndpoints: [
            "https://torus-19.torusnode.com/jrpc",
            "https://torus-node.ens.domains/jrpc",
            "https://torus-node.matic.network/jrpc",
            "https://torus.zilliqa.network/jrpc",
            "https://torus-mainnet.cosmos.network/jrpc",
            "https://torus2.etherscan.com/jrpc",
            "https://torus-node-v2.skalelabs.com/jrpc",
            "https://torus-node.binancex.dev/jrpc",
            "https://torusnode.ont.io/jrpc",
        ], _torusIndexes: [1, 2, 3, 4, 5, 6, 7, 8, 9], _torusNodePub: [
            .init(_X: "bbe83c64177c3775550e6ba6ac2bc059f6847d644c9e4894e42c60d7974d8c2b", _Y:
                "82b49a7caf70def38cdad2740af45c1e4f969650105c5019a29bb18b21a9acb5"),

            .init(_X: "c208cac4ef9a47d386097a9c915b28e9cb89213abee8d26a17198ee261201b0d", _Y:
                "c7db2fe4631109f40833de9dc78d07e35706549ee48fa557b33e4e75e1047873"),

            .init(_X: "0ca1766bb426d4ca5582818a0c5439d560ea64f5baa060793ab29dd3d0ceacfe", _Y:
                "d46c1d08c40e1306e1bca328c2287b8268166b11a1ba4b8442ea2ad0c5e32152"),

            .init(_X: "c3934dd2f6f4b3d2e1e398cc501e143c1e1a381b52feb6d1525af34d16253768", _Y:
                "71f5141a5035799099f5ea3e241e66946bc55dc857ac3bd7d6fcdb8dcd3eeeef"),

            .init(_X: "22e66f1929631d00bf026227581597f085fd94fd952fc0dca9f0833398b5c064", _Y:
                "6088b3912e10a1e9d50355a609c10db7d188f16a2e2fd7357e51bf4f6a74f0a1"),

            .init(_X: "9dc9fa410f3ce9eb70df70cdea00a49f2c4cc7a31c08c0dab5f863ed35ff5139", _Y:
                "627a291cb87a75c61da3f65d6818e1e05e360217179817ed27e8c73bca7ec122"),

            .init(_X: "118b9fc07e97b096d899b9f6658463ce6a8caa64038e37fc969df4e6023dd8c6", _Y:
                "baf9fa4e51770f4796ea165dd03a769b8606681a38954a0a92c4cbffd6609ce9"),

            .init(_X: "8a6d8b925da15a273dec3d8f8395ec35cd6878f274b2b180e4e106999db64043", _Y:
                "96f67f870c157743da0b1eb84d89bf30500d74dc84c11f501ee1cb013acc8c46"),

            .init(_X: "39cecb62e863729f572f7dfc46c24867981bf04bb405fed0df39e33984bfade5", _Y:
                "61c2364434012e68a2be2e9952805037e52629d7762fafc8e10e9fb5bad8f790"),
        ], _updated: false)
    }

    private var currentEpoch: BigUInt = 0
    private var torusNodeEndpoints = [String]()
    private var torusNodePub: [TorusNodePubModel] = []
    private var torusIndexes: [BigUInt] = []
    private var client: EthereumClientProtocol
    private var network: EthereumNetworkFND = EthereumNetworkFND.MAINNET
    private var proxyAddress: EthereumAddress
    private var projectID: String = "7f287687b3d049e2bea7b64869ee30a3"
    private let yourContractABI: String = contractABIString
    private var urlSession: URLSession
    private var updated = false
    var nodeDetails: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _nodeListAddress: proxyAddress.value, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }

    public init(proxyAddress: String = FetchNodeDetails.proxyAddressMainnet, network: EthereumNetworkFND = .MAINNET, logLevel: OSLogType = .default, urlSession: URLSession = URLSession.shared) {
        fndLogType = logLevel // to be used across application
        self.proxyAddress = EthereumAddress(proxyAddress)
        self.network = network
        self.urlSession = urlSession
        let clientUrl = network == .CUSTOM(path: network.path) ? URL(string: network.path)! : URL(string: "https://\(network.path).infura.io/v3/\(projectID)")!
        client = EthereumClient(url: clientUrl, sessionConfig: self.urlSession.configuration)
    }

    public func getNodeDetails(verifier: String, verifierID: String) -> Promise<AllNodeDetailsModel> {
        let (tempPromise, seal) = Promise<AllNodeDetailsModel>.pending()
        if updated && (proxyAddress.value == FetchNodeDetails.proxyAddressMainnet || proxyAddress.value == FetchNodeDetails.proxyAddressRopsten) {
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
                if self.proxyAddress.value == FetchNodeDetails.proxyAddressMainnet {
                    seal.fulfill(FetchNodeDetails.nodeDetailsMainnet)
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
