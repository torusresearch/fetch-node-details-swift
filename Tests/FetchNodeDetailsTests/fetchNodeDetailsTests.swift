import XCTest
import BigInt
import web3
import OSLog
import FetchNodeDetails

class fetchNodeDetailsTests: XCTestCase{
    var timeout:TimeInterval = 10
    
    func test_getNode_MainNet(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80", network: .MAINNET)
        fnd.getAllNodes(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputMainNet(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80").val)
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    func test_getNode_MainNet_skip(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80", network: .MAINNET)
        fnd.getAllNodes(skip:true,verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputMainNetStatic(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80").val)
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    func test_getNode_Polygon(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005", network: .POLYGON)
        fnd.getAllNodes(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputPolygon(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005").val)
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    func test_getNode_Polygon_skip(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005", network: .POLYGON)
        fnd.getAllNodes(skip:true,verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputPolygon(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005").val)
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    func test_getNode_Ropsten(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7", network: .ROPSTEN)
        fnd.getAllNodes(verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputRopsten(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7").val)
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
    
    func test_getNode_Ropsten_skip(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7", network: .ROPSTEN)
        fnd.getAllNodes(skip:true,verifier: "google", verifierID: "hello@tor.us").done { result in
            XCTAssertEqual(result, SampleOutputRopsten(proxyAddress: "0x6258c9d6c12ed3edda59a1a6527e469517744aa7").val)
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
    }
}


