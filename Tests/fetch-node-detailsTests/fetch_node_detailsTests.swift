import XCTest
import BigInt
@testable import fetch_node_details

final class fetch_node_detailsTests: XCTestCase {
    
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
        ("testGetNodeEndpoints", testGetNodeEndpoints),
        ("testGetNodeDetails", testGetNodeDetails),
        ("testBigIntCapabilities", testBigIntCapabilities)
    ]
}
