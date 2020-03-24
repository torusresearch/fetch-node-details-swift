import XCTest
import BigInt
import PromiseKit
@testable import fetch_node_details

final class fetch_node_detailsTestsSync: XCTestCase {
    
    func testgetCurrentEpoch(){
        let fnd = FetchNodeDetails();
        let test = fnd.getCurrentEpoch();
        print(test)
    }
    func testGetNodeEndpoints(){
        let fnd = FetchNodeDetails();
        let details = try! fnd.getNodeEndpoint(nodeEthAddress: "0x40e8f0D606281b0a1d9D8Ac9030AaaE9D51229D1")
        //print(details)
    }
    
    func testGetNodeDetails(){
        let fnd = FetchNodeDetails();
        let details = fnd.getNodeDetails()
        print(details)
    }
    
    func testBigIntCapabilities(){
        var a = "107082045066154177533035871355946698712954231105108535436156312542445529617311"
        var newint = BigInt(a, radix:10)
        //print(newint, BigInt(newint!, radix: 16))
        print(String(newint!, radix:16, uppercase: true))
        
    }
    
    static var allTests = [
        ("testgetCurrentEpoch", testgetCurrentEpoch),
        ("testGetNodeEndpoints", testGetNodeEndpoints),
        ("testGetNodeDetails", testGetNodeDetails),
        ("testBigIntCapabilities", testBigIntCapabilities)
    ]
}

final class fetch_node_detailsTestsAsync: XCTestCase{
    
    func test_async_getCurrentEpoch(){
        let fnd = FetchNodeDetails();
        let test = try! fnd.getCurrentEpochPromise()
        print(test)
        test.done{ result in
            print("result", result)
        }
        do{
            sleep(5)
        }
        //print(test)
    }
    
    func test_getNodeDetailsPromise(){
        let fnd = FetchNodeDetails();
        let expectation = self.expectation(description: "getting node details")
        var results = false;
        try! fnd.getNodeDetailsPromise().done{ response in
            print("response", response);
            results = response
            expectation.fulfill()
        }.catch{err in print(err)}
        
        waitForExpectations(timeout: 20)
        XCTAssertEqual(results, true)

    }
    
    static var allTests = [
        ("test_async_getCurrentEpoch", test_async_getCurrentEpoch),
        ("test_getNodeDetailsPromise", test_getNodeDetailsPromise)

    ]
}
