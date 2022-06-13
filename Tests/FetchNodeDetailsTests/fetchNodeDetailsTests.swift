import BigInt
import FetchNodeDetails
import OSLog
import web3
import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10

    func test_getNode_MainNet() async {
        let fnd = FetchNodeDetails()
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
            XCTAssertEqual(result, SampleOutputMainNet(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80").val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_custom_path_MainNet() async {
        let fnd = FetchNodeDetails(network: .CUSTOM(path: "https://\("mainnet").infura.io/v3/\("7f287687b3d049e2bea7b64869ee30a3")"))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
            XCTAssertEqual(result, SampleOutputMainNet(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80").val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_Ropsten() async {
        let fnd = FetchNodeDetails(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7", network: .ROPSTEN)
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
            XCTAssertEqual(result, SampleOutputRopsten(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7").val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_Polygon() async {
        let fnd = FetchNodeDetails(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005", network: .POLYGON)
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
            XCTAssertEqual(result, SampleOutputPolygon(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005").val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
}
