@testable import FetchNodeDetails
import FndBase

import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10
    var verifierId = "hello@tor.us"
    func test_getNode_Mainnet() async {
        let fnd = NodeDetailManager(network: .legacy(.MAINNET))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputMainnet().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
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

    func test_getNode_Testnet() async {
        let fnd = NodeDetailManager(network: .legacy(.TESTNET))

        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputTestnet().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_getNode_SapphireDevnet() async {
        let fnd = NodeDetailManager(network: .sapphire(.SAPPHIRE_DEVNET))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            var config = try! SapphireConfig(network: .SAPPHIRE_DEVNET)
            config.updated = true
            XCTAssertEqual(result, config)
            XCTAssertEqual(result, SampleOutputSAPPHIREDEVNET().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_getNode_SapphireMainnet() async {
        let fnd = NodeDetailManager(network: .sapphire(.SAPPHIRE_MAINNET))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            var config = try! SapphireConfig(network: .SAPPHIRE_MAINNET)
            config.updated = true
            XCTAssertEqual(result, config)
            XCTAssertEqual(result, SampleOutputSAPPHIREMAINNET().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    
    func test_getNode_Cyan() async {
        let fnd = NodeDetailManager(network: .legacy(.CYAN))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputCyan().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_Aqua() async {
        let fnd = NodeDetailManager(network: .legacy(.AQUA))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
            XCTAssertEqual(result, SampleOutputAqua().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_Celeste() async {
        do {
            let fnd = NodeDetailManager(network: .legacy(.CELESTE))
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
            XCTAssertEqual(result, SampleOutputCeleste().val)
        } catch {
            XCTFail()
        }
    }
}
