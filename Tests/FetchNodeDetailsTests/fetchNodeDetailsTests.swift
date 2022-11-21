import BigInt
import FetchNodeDetails
import OSLog
import web3
import XCTest

class fetchNodeDetailsTests: XCTestCase {
    var timeout: TimeInterval = 10

    func test_getNode_MainNet() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails()
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputMainNet().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }

    func test_getNode_custom_path_MainNet() {
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(network: .CUSTOM(path: "https://\("mainnet").infura.io/v3/\("7f287687b3d049e2bea7b64869ee30a3")"))
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
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
        let fnd = FetchNodeDetails(proxyAddress: FetchNodeDetails.proxyAddressAqua, network: .AQUA)
        fnd.getNodeDetails(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputAqua().val)
            exp.fulfill()
        }.catch { _ in
            XCTFail()
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
