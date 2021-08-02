import XCTest
import BigInt
import web3
@testable import FetchNodeDetails

final class fetch_node_detailsTestsSync: XCTestCase {
    // mainnet proxy contract address - 0x638646503746d5456209e33a2ff5e3226d698bea
    // testnet proxt contract address - 0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183
    
    var currentEpoch = 0
    
//    func testGetCurrentEpoch(){
//        let fnd = FetchNodeDetails(proxyAddress: "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183", network: EthereumNetwork.ROPSTEN);
//        let foundEpoch = fnd.getCurrentEpoch();
//        let expectedEpoch = 19
//        XCTAssertEqual(foundEpoch, expectedEpoch, "same epoch")
//    }
//
//    func testGetEpochInfo(){
//        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: EthereumNetwork.MAINNET);
//        let test = try! fnd.getEpochInfo(epoch: 18)
//    }
//
//    func testGetNodeEndpoints(){
//        let fnd = FetchNodeDetails(proxyAddress: "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183", network: EthereumNetwork.ROPSTEN);
//        let details = try! fnd.getNodeEndpoint(nodeEthAddress: "0x40e8f0d606281b0a1d9d8ac9030aaae9d51229d1")
//        print(details)
//    }
//
//    func testGetNodeDetails(){
//        let fnd = FetchNodeDetails(proxyAddress: "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183", network: EthereumNetwork.ROPSTEN);
//        let details = fnd.getNodeDetails()
//        print(details.getTorusNodeEndpoints())
//    }
//
//    static var allTests = [
//        ("testGetCurrentEpoch", testGetCurrentEpoch),
//        ("testGetNodeEndpoints", testGetNodeEndpoints),
//        ("testGetNodeDetails", testGetNodeDetails),
//        ("testGetEpochInfo", testGetEpochInfo)
//    ]
}

final class fetch_node_detailsTestsAsync: XCTestCase{

//    func test_async_getCurrentEpoch(){
//        let fnd = FetchNodeDetails(proxyAddress: "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183", network: EthereumNetwork.ROPSTEN);
//        let exp = self.expectation(description: "Current epoch Async")
//        let test = try! fnd.getCurrentEpochPromise()
//        test.done{ data in
//            XCTAssertTrue(type(of: data) == Int.self)
//            exp.fulfill()
//        }
//        waitForExpectations(timeout: 5)
//    }
    
    func test_async_getEpochInfo(){
        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: EthereumNetwork.MAINNET);
        let exp = self.expectation(description: "Current epoch Async")
        let test = try! fnd.getEpochInfoPromise(epoch: 19)
        test.done{ data in
            XCTAssertTrue(type(of: data) == Int.self)
            exp.fulfill()
        }
        waitForExpectations(timeout: 500)
    }
    
//
//    func test_getNodeDetailsPromise(){
//        let fnd = FetchNodeDetails(proxyAddress: "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183", network: EthereumNetwork.ROPSTEN);
//        let exp = self.expectation(description: "getting node details")
//
//        try! fnd.getNodeDetailsPromise().done{ response in
//            exp.fulfill()
//        }.catch{err in print(err)}
//
//        waitForExpectations(timeout: 10)
//    }
//
//    static var allTests = [
//        ("test_async_getCurrentEpoch", test_async_getCurrentEpoch),
//        ("test_getNodeDetailsPromise", test_getNodeDetailsPromise),
////        ("test_getNodeEndpointPromise", test_getNodeEndpointPromise)
//
//    ]
}
