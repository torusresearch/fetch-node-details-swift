import XCTest
import BigInt
import web3
@testable import FetchNodeDetails
@testable import web3

final class fetch_node_detailsTestsAsync: XCTestCase{
    
    let encoder = ABIFunctionEncoder("test")

    func test_GivenTupleWithArrayAndNumber_EncodesCorrectly() {
        
        let arr = [EthereumAddress("0xdF136715f7bafD40881cFb16eAa5595C2562972b"), EthereumAddress("0xdF136715f7bafD40921cFb16eAa5595C2562972b")]
        let tuple = TupleWithArrayAndNumber(owners: arr, value: 98)
        
        try? encoder.encode(tuple)
        
        let encoded = try? encoder.encoded().web3.hexString
        
        XCTAssertEqual(encoded, "0x7a90ff650000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000004000000000000000000000000000000000000000000000000000000000000000620000000000000000000000000000000000000000000000000000000000000002000000000000000000000000df136715f7bafd40881cfb16eaa5595c2562972b000000000000000000000000df136715f7bafd40921cfb16eaa5595c2562972b")
        
        let value = try? ABIDecoder.decodeData(encoded?.replacingOccurrences(of: "7a90ff65", with: "") ?? "", types: [TupleWithArrayAndNumber.self])
        
        let decodedTuple: TupleWithArrayAndNumber? = try? value?[0].decoded()
        
        XCTAssertEqual(decodedTuple?.owners.first, EthereumAddress("0xdF136715f7bafD40881cFb16eAa5595C2562972b"))
        XCTAssertEqual(decodedTuple?.owners.last, EthereumAddress("0xdF136715f7bafD40921cFb16eAa5595C2562972b"))
        XCTAssertEqual(decodedTuple?.value, 98)
        
    }
    
    func test_GivenTupleWithDynamicArray_EncodesCorrectly() {
        
//                let arr = [EthereumAddress("40e8f0d606281b0a1d9d8ac9030aaae9d51229d1"),
//        EthereumAddress("1c1895be5c0951da5b3663f5820e23ee74d99f87"),
//        EthereumAddress("8dfa7764a9fdffff1305fac1ee2dfc1513602c30"),
//        EthereumAddress("31bdf7cfc8d70bed513e27ba9e96d94635065b03"),
//        EthereumAddress("f3d1ce44e2399c931d705872c83a020693711e0a"),
//        EthereumAddress("014fa226e56f5df33aed56d62882eb1db9052047"),
//        EthereumAddress("45a0ffdd0d2d853e7f25e3c51567e9803dbacaa3"),
//        EthereumAddress("f2fa106065fa4131f71988d2c24caa235c399bc8"),
//        EthereumAddress("73f1fd7b5e0501ad1e79353c73b1692d4b4b8a6c")]
//        let tuple = TupleWithArray(id: BigInt("18", radix: 10)!, n: BigInt("9", radix: 10)!, k: BigInt("5", radix: 10)!, t: BigInt("2", radix: 10)!, nodeList: arr, prevEpoch: BigInt("17", radix: 10)!, nextEpoch: BigInt("19", radix: 10)!)
//
//        try? encoder.encode(tuple)
//
//        let encoded = try? encoder.encoded().web3.hexString
//
//        print(encoded)
//
//        XCTAssertEqual(encoded, "0x46ac7ac90000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001200000000000000000000000000000000000000000000000000000000000000090000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000000110000000000000000000000000000000000000000000000000000000000000013000000000000000000000000000000000000000000000000000000000000000900000000000000000000000040e8f0d606281b0a1d9d8ac9030aaae9d51229d10000000000000000000000001c1895be5c0951da5b3663f5820e23ee74d99f870000000000000000000000008dfa7764a9fdffff1305fac1ee2dfc1513602c3000000000000000000000000031bdf7cfc8d70bed513e27ba9e96d94635065b03000000000000000000000000f3d1ce44e2399c931d705872c83a020693711e0a000000000000000000000000014fa226e56f5df33aed56d62882eb1db905204700000000000000000000000045a0ffdd0d2d853e7f25e3c51567e9803dbacaa3000000000000000000000000f2fa106065fa4131f71988d2c24caa235c399bc800000000000000000000000073f1fd7b5e0501ad1e79353c73b1692d4b4b8a6c")
////
        let epochit = "0x0000000000000000000000000000000000000000000000000000000000000020000000000000000000000000000000000000000000000000000000000000001300000000000000000000000000000000000000000000000000000000000000090000000000000000000000000000000000000000000000000000000000000005000000000000000000000000000000000000000000000000000000000000000200000000000000000000000000000000000000000000000000000000000000e000000000000000000000000000000000000000000000000000000000000000120000000000000000000000000000000000000000000000000000000000000014000000000000000000000000000000000000000000000000000000000000000900000000000000000000000058df12150e765cfa08d3d7027ffefe3ebc6a977d0000000000000000000000003e7802ac3428d29d942abe0d967481b36f84023f00000000000000000000000070eaf5a4b5c1e4585283976eef0c7ef0beb7676e000000000000000000000000c1be81db2ec118bb8ca6d0775bbf440a0a1a83120000000000000000000000006651a20286e600af76d985a4d155db8c31f2c1aa0000000000000000000000003609c974fe0251fee429da927676163016ab12aa000000000000000000000000564cca5c23a40a9b322d567e5458a1edf3f1457f00000000000000000000000065f8296b232afefd295ff4fd854b67f26de15e33000000000000000000000000f4cbfad568777ddd64b860b6886241c6b25d2491"
        
        let value = try! ABIDecoder.decodeData(epochit, types: [TupleWithArray.self]) // function signature
//        let value = try! ABIDecoder.decodeData(encoded?.replacingOccurrences(of: "46ac7ac9", with: "") ?? "", types: [TupleWithArray.self]) // function signature

        let decodedTuple: TupleWithArray? = try? value[0].decoded()
        print(decodedTuple)
        
        // print(decodedTuple?.owners)
        // XCTAssertEqual(decodedTuple?.owners.first, EthereumAddress("0xdF136715f7bafD40881cFb16eAa5595C2562972b"))
        // XCTAssertEqual(decodedTuple?.owners.last, EthereumAddress("0x64d0ea4fc60f27e74f1a70aa6f39d403bbe56793"))
        
    }
    
    func test_getEpochInfo(){
        let exp = expectation(description: "sample")
        let fnd = FetchNodeDetails(proxyAddress: "0x638646503746d5456209e33a2ff5e3226d698bea", network: .MAINNET)
        
        let EpochInfo = EpochInfo(id: BigInt("19", radix: 10)!, n: BigInt("9", radix: 10)!, k: BigInt("5", radix: 10)!, t: BigInt("2", radix: 10)!, nodeList: [], prevEpoch: BigInt("17", radix: 10)!, nextEpoch: BigInt("19", radix: 10)!)
        try! fnd.getEpochInfoPromise(epoch: 19).done{ data in
            XCTAssertEqual(data.id, EpochInfo.id)
            exp.fulfill()
        }.catch{ error in
            XCTFail()
        }
        wait(for: [exp], timeout: 5)
    }
}

struct TupleWithArray: ABITuple{
    
    static var types: [ABIType.Type] { [BigInt.self, BigInt.self, BigInt.self, BigInt.self, ABIArray<EthereumAddress>.self, BigInt.self, BigInt.self] }
    
    var id: BigInt
    var n: BigInt
    var k: BigInt
    var t: BigInt
    var nodeList: [EthereumAddress]
    var prevEpoch: BigInt
    var nextEpoch: BigInt
    
    init(id: BigInt,
         n: BigInt,
         k: BigInt,
         t: BigInt,
         nodeList: [EthereumAddress],
         prevEpoch: BigInt,
         nextEpoch: BigInt) {
        self.id =  id
        self.n = n
        self.k = k
        self.t = t
        self.nodeList = nodeList
        self.prevEpoch = prevEpoch
        self.nextEpoch = nextEpoch
    }
    
    init?(values: [ABIDecoder.DecodedValue]) throws {
        self.nodeList = try values.dropLast(2).dropFirst(4).map{try $0.decoded() }

        self.id = try values[0].decoded()
        self.n = try values[1].decoded()
        self.k = try values[2].decoded()
        self.t = try values[3].decoded()
        self.prevEpoch = try values[values.count-2].decoded()
        self.nextEpoch = try values[values.count-1].decoded()
        
    }
    
    func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(id)
        try encoder.encode(n)
        try encoder.encode(k)
        try encoder.encode(t)
        try encoder.encode(nodeList)
        try encoder.encode(prevEpoch)
        try encoder.encode(nextEpoch)
    }
    
    var encodableValues: [ABIType] { [id, n, k, t, ABIArray(values: nodeList), prevEpoch, nextEpoch] }
}


struct TupleWithArrayAndNumber: ABITuple, Equatable {
    static var types: [ABIType.Type] { [ABIArray<EthereumAddress>.self, BigUInt.self] }
    
    var owners: [EthereumAddress]
    var value: BigUInt
    
    init(owners: [EthereumAddress],
         value: BigUInt) {
        self.owners = owners
        self.value = value
    }
    
    init?(values: [ABIDecoder.DecodedValue]) throws {
        self.owners = try values.dropLast().map { try $0.decoded() }
        self.value = try values[values.count - 1].decoded()
    }
    
    func encode(to encoder: ABIFunctionEncoder) throws {
        try encoder.encode(owners)
        try encoder.encode(value)
    }
    
    var encodableValues: [ABIType] { [ABIArray(values: owners), value] }
}
