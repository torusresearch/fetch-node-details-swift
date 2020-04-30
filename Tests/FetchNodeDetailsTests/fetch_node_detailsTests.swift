import XCTest
import BigInt
import PromiseKit
@testable import FetchNodeDetails

final class fetch_node_detailsTestsSync: XCTestCase {
    
    func testGetCurrentEpoch(){
        let fnd = FetchNodeDetails();
        let test = fnd.getCurrentEpoch();
        XCTAssertTrue(type(of: test) == Int.self)
    }
    
    func testGetEpochInfo(){
        let fnd = FetchNodeDetails()
        let test = try! fnd.getEpochInfo(epoch: 18)
    }
    
    func testGetNodeEndpoints(){
        let fnd = FetchNodeDetails();
        let details = try! fnd.getNodeEndpoint(nodeEthAddress: "0x40e8f0d606281b0a1d9d8ac9030aaae9d51229d1")
    }
    
    func testGetNodeDetails(){
        let fnd = FetchNodeDetails();
        let details = fnd.getNodeDetails()
    }
    
    static var allTests = [
        ("testGetCurrentEpoch", testGetCurrentEpoch),
        ("testGetNodeEndpoints", testGetNodeEndpoints),
        ("testGetNodeDetails", testGetNodeDetails),
        ("testGetEpochInfo", testGetEpochInfo)
    ]
}

final class fetch_node_detailsTestsAsync: XCTestCase{

    func test_async_getCurrentEpoch(){
        let fnd = FetchNodeDetails();
        let exp = self.expectation(description: "Current epoch Async")
        let test = try! fnd.getCurrentEpochPromise()
        test.done{ data in
            XCTAssertTrue(type(of: data) == Int.self)
            exp.fulfill()
        }
        waitForExpectations(timeout: 5)
    }
    
    func test_getNodeEndpointPromise(){
        let fd = FetchNodeDetails()
        let exp = self.expectation(description: "getting node endpoints")
        fd.getNodeEndpointPromise(nodeEthAddress: "0x40e8f0D606281b0a1d9D8Ac9030AaaE9D51229D1").done{ response in
            exp.fulfill()
        }
        waitForExpectations(timeout: 10)
    }
    
    func test_getNodeDetailsPromise(){
        let fnd = FetchNodeDetails();
        let exp = self.expectation(description: "getting node details")
        
        try! fnd.getNodeDetailsPromise().done{ response in
            XCTAssertTrue(response)
            exp.fulfill()
        }.catch{err in print(err)}
        
        waitForExpectations(timeout: 10)
    }
    
    static var allTests = [
        ("test_async_getCurrentEpoch", test_async_getCurrentEpoch),
        ("test_getNodeDetailsPromise", test_getNodeDetailsPromise),
        ("test_getNodeEndpointPromise", test_getNodeEndpointPromise)

    ]
}
