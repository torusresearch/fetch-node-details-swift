import XCTest
@testable import fetch_node_details

final class fetch_node_detailsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        let fnd = FetchNodeDetails();
        let currentEpoch = fnd.getCurrentEpoch()
        print("currentEpochValue", currentEpoch)
        // let epochInfo = fnd.getEpochInfo(epoch: currentEpoch)
        // let nodeDetails = fnd.getNodeEndpoint(nodeEthAddress: "0x40e8f0D606281b0a1d9D8Ac9030AaaE9D51229D1")
        
        //let details = fnd.getNodeDetails()
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}
