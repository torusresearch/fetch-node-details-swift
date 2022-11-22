import XCTest
@testable import FetchNodeDetails

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10
    var verifierID = "hello@tor.us"
    func test_getNode_MainNet() async {
        let fnd = FetchNodeDetails()
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierID)
            XCTAssertEqual(result, SampleOutputMainNet().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_custom_path_MainNet() async {
        let fnd = FetchNodeDetails(network: .CUSTOM(path: "https://\("mainnet").infura.io/v3/\("7f287687b3d049e2bea7b64869ee30a3")"))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierID)
            XCTAssertEqual(result, SampleOutputMainNet().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_Ropsten() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressTestnet, network: .TESTNET)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputTestnet().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_Cyan() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressCyan, network: .CYAN)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputCyan().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_Aqua() {
        let exp = expectation(description: "should get node details")
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

        // Ropsten deprecation test
    func test_getNode_Ropsten() async {
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressRopsten, network: .CUSTOM(path: "https://rpc.ankr.com/eth_ropsten"))
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierID)
            XCTAssertEqual(result, SampleOutputRopsten().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }

    func test_getNode_Polygon() async {
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressPolygon, network: .POLYGON)
        do {
            let result = try await fnd.getNodeDetails(verifier: "google", verifierID: verifierID)
            XCTAssertEqual(result, SampleOutputPolygon().val)
        } catch {
            XCTFail(error.localizedDescription)
        }
    }
    
    func test_getNode_Aqua() async {
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressAqua, network: .AQUA)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
        do {
            let result = try await fnd.getNodeDetails(verifier: "glipandroid", verifierID: verifierID)
            XCTAssertEqual(result, SampleOutputAqua().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        } catch {
            XCTFail(error.localizedDescription)
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_Celeste() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressCeleste, network: .CELESTE)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputCeleste().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
}
