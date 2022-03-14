import XCTest
import BigInt
import web3
import OSLog
@testable import FetchNodeDetails
@testable import web3

class fetchNodeDetailsTests: XCTestCase{
    
    let encoder = ABIFunctionEncoder("test")
    
    func test_getCurrentEpoch(){
        let exp = expectation(description: "Should be able to get current epoch")
        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: .MAINNET, logLevel: .default)
        
        fnd.getCurrentEpochPromise().done{ data in
            XCTAssertNotNil(data)
            exp.fulfill()
        }.catch{ error in
            XCTFail()
        }
        wait(for: [exp], timeout: 10)
    }
    
    
    func test_getEpochInfo(){
        let exp = expectation(description: "should be able to get Epoch info")
        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: .MAINNET, logLevel: .info)
        
        let EpochInfo = EpochInfo(id: BigUInt("19", radix: 10)!, n: BigUInt("9", radix: 10)!, k: BigUInt("5", radix: 10)!, t: BigUInt("2", radix: 10)!, nodeList: [], prevEpoch: BigUInt("17", radix: 10)!, nextEpoch: BigUInt("19", radix: 10)!)
        let epochToCheck = BigUInt(19)
        
        fnd.getEpochInfoPromise(epoch: epochToCheck).done{ data in
            XCTAssertEqual(data.id, EpochInfo.id)
            exp.fulfill()
        }.catch{ error in
            XCTFail()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func test_getNodeDetails(){
        let exp = expectation(description: "Should be ablt to get node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: .MAINNET)
        
        fnd.getNodeDetails(nodeEthAddress: "0x58DF12150e765cFa08d3d7027FFeFe3EBC6a977d").done{ data in
            exp.fulfill()
        }.catch{ error in
            XCTFail()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func test_getAllNodeDetails(){
        let exp = expectation(description: "Should be able to get all node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: .MAINNET, logLevel: .debug)
        
        fnd.getAllNodeDetails().done{ data in
            exp.fulfill()
        }.catch{ error in
            XCTFail()
        }
        wait(for: [exp], timeout: 10)
    }
    
    func test_getAllNodeDetailsTestnet(){
        let exp = expectation(description: "Should be able to get all node details")
        let fnd = FetchNodeDetails(proxyAddress: "0x4023d2a0D330bF11426B12C6144Cfb96B7fa6183", network: .ROPSTEN, logLevel: .debug)
        
        fnd.getAllNodeDetails().done{ data in
            exp.fulfill()
        }.catch{ error in
            XCTFail()
        }
        wait(for: [exp], timeout: 10)
    }
}
