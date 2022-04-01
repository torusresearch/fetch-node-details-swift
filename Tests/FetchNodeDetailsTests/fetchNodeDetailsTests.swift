import XCTest
import BigInt
import web3
import OSLog
@testable import FetchNodeDetails
@testable import web3

class fetchNodeDetailsTests: XCTestCase{
    
    var timeout:TimeInterval = 10
    //Test for MainNet
    func test_getNode_MainNet(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0xf20336e16B5182637f09821c27BDe29b0AFcfe80", network: .POLYGON)
        fnd.getAllNodes(verifer: "google", veriferID: "hello@tor.us").done { result in
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
        
    }
    
    func test_getNode_Polygon(){
        let exp = expectation(description: "should get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x9f072ba19b3370e512aa1b4bfcdaf97283168005", network: .POLYGON)
        fnd.getAllNodes(verifer: "google", veriferID: "hello@tor.us").done { result in
            exp.fulfill()
        }.catch { error in
            XCTFail()
        }
        wait(for: [exp], timeout: timeout)
        
    }
    
}
