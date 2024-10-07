@testable import FetchNodeDetails

import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10
    var verifierId = "hello@tor.us"
    func test_getNode_Mainnet() async throws {
        let fnd = NodeDetailManager(network: .MAINNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        XCTAssertEqual(result, SampleOutputMainnet().val)
    }

    // TODO: https://mainnet.infura.io/v3/7f287687b3d049e2bea7b64869ee30a3 is unsupported network
//    func test_getNode_custom_path_Mainnet() async {
//        let fnd = FetchNodeDetails(network: .CUSTOM(path: "https://\("mainnet").infura.io/v3/\("7f287687b3d049e2bea7b64869ee30a3")"))
//        do {
//            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
//            XCTAssertEqual(result, SampleOutputMainnet().val)
//        } catch {
//            XCTFail()
//        }
//    }

    func test_getNode_Testnet() async throws {
        let fnd = NodeDetailManager(network: .TESTNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        XCTAssertEqual(result, SampleOutputTestnet().val)
    }

    func test_getNode_SapphireDevnet() async throws {
        let fnd = NodeDetailManager(network: .SAPPHIRE_DEVNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        var config = try! SapphireConfig(network: .SAPPHIRE_DEVNET)
        config.setUpdated(updated: true)
        XCTAssertEqual(result, config)
        XCTAssertEqual(result, SampleOutputSAPPHIREDEVNET().val)
    }

    func test_getNode_SapphireMainnet() async throws {
        let fnd = NodeDetailManager(network: .SAPPHIRE_MAINNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        var config = try! SapphireConfig(network: .SAPPHIRE_MAINNET)
        config.setUpdated(updated: true)
        XCTAssertEqual(result, config)
        XCTAssertEqual(result, SampleOutputSAPPHIREMAINNET().val)
    }

    func test_getNode_Cyan() async throws {
        let fnd = NodeDetailManager(network: .CYAN)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        XCTAssertEqual(result, SampleOutputCyan().val)
    }

    func test_getNode_Aqua() async throws {
        let fnd = NodeDetailManager(network: .AQUA)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        XCTAssertEqual(result, SampleOutputAqua().val)
    }
    
    func test_getMetadata_Mainnet() async throws {
        let fnd = NodeDetailManager(network: .MAINNET)
        let result = try await fnd.getMetadataUrl()
        XCTAssertEqual(result, "https://metadata.web3auth.io")
    }
    
    func test_getMetadata_SapphireMainnet() async throws {
        let fnd = NodeDetailManager(network: .SAPPHIRE_MAINNET)
        let result = try await fnd.getMetadataUrl()
        XCTAssertEqual(result, SampleOutputSAPPHIREMAINNET().val.getTorusNodeEndpoints()[0].replacingOccurrences(of: "/sss/jrpc", with: "/metadata"))
    }
}
