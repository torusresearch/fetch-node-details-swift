import FetchNodeDetails

import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10
    var verifierId = "hello@tor.us"
    func test_getNode_Mainnet() async throws {
        let fnd = NodeDetailManager(network: .MAINNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        XCTAssertEqual(result, SampleOutputMainnet().val)
    }

    func test_getNode_Testnet() async throws {
        let fnd = NodeDetailManager(network: .TESTNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        XCTAssertEqual(result, SampleOutputTestnet().val)
    }

    func test_getNode_SapphireDevnet() async throws {
        let fnd = NodeDetailManager(network: .SAPPHIRE_DEVNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        let config = try! SapphireConfig(network: .SAPPHIRE_DEVNET)!
        config.updated = true
        XCTAssertEqual(result, config)
        XCTAssertEqual(result, SampleOutputSAPPHIREDEVNET().val)
    }

    func test_getNode_SapphireMainnet() async throws {
        let fnd = NodeDetailManager(network: .SAPPHIRE_MAINNET)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierId)
        let config = try! SapphireConfig(network: .SAPPHIRE_MAINNET)!
        config.updated = true
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

    func test_getNode_Celeste() async throws {
        let fnd = NodeDetailManager(network: .CELESTE)
        let result = try await fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us")
        XCTAssertEqual(result, SampleOutputCeleste().val)
    }
    
    func test_getMetadata_Mainnet() async throws {
        let fnd = NodeDetailManager(network: .MAINNET)
        let result = try await fnd.getMetadataUrl()
        XCTAssertEqual(result, "https://metadata.web3auth.io")
    }
    
    func test_getMetadata_SapphireMainnet() async throws {
        let fnd = NodeDetailManager(network: .SAPPHIRE_MAINNET)
        let result = try await fnd.getMetadataUrl()
        XCTAssertEqual(result, "https://metadata.web3auth.io")
    }
}
