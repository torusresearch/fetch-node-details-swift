//
//  File.swift
//  
//
//  Created by Dhruv Jaiswal on 04/04/22.
//

import Foundation
import BigInt
import web3
@testable import web3


struct SampleOutputMainet{
    var currentEpoch:BigUInt = 19

    var proxyAddress:String
    var torusNodeEndpoints = [
        "https://torus-19.torusnode.com/jrpc",
        "https://torus-node.ens.domains/jrpc",
        "https://torus-node.matic.network/jrpc",
        "https://torus.zilliqa.network/jrpc",
        "https://torus-mainnet.cosmos.network/jrpc",
        "https://torus2.etherscan.com/jrpc",
        "https://torus-node-v2.skalelabs.com/jrpc",
        "https://torus-node.binancex.dev/jrpc",
        "https://torusnode.ont.io/jrpc"
      ]

    var torusNodePub: [TorusNodePub] = [
        
    .init(_X: "bbe83c64177c3775550e6ba6ac2bc059f6847d644c9e4894e42c60d7974d8c2b", _Y:
            "82b49a7caf70def38cdad2740af45c1e4f969650105c5019a29bb18b21a9acb5"),
    
    .init(_X: "c208cac4ef9a47d386097a9c915b28e9cb89213abee8d26a17198ee261201b0d", _Y:
            "c7db2fe4631109f40833de9dc78d07e35706549ee48fa557b33e4e75e1047873"),
    
    .init(_X: "0ca1766bb426d4ca5582818a0c5439d560ea64f5baa060793ab29dd3d0ceacfe", _Y:
            "d46c1d08c40e1306e1bca328c2287b8268166b11a1ba4b8442ea2ad0c5e32152"),
    
    .init(_X: "c3934dd2f6f4b3d2e1e398cc501e143c1e1a381b52feb6d1525af34d16253768", _Y:
            "71f5141a5035799099f5ea3e241e66946bc55dc857ac3bd7d6fcdb8dcd3eeeef"),
    
    .init(_X: "22e66f1929631d00bf026227581597f085fd94fd952fc0dca9f0833398b5c064", _Y:
            "6088b3912e10a1e9d50355a609c10db7d188f16a2e2fd7357e51bf4f6a74f0a1"),
    
    .init(_X: "9dc9fa410f3ce9eb70df70cdea00a49f2c4cc7a31c08c0dab5f863ed35ff5139", _Y:
            "627a291cb87a75c61da3f65d6818e1e05e360217179817ed27e8c73bca7ec122"),
    
    .init(_X: "118b9fc07e97b096d899b9f6658463ce6a8caa64038e37fc969df4e6023dd8c6", _Y:
            "baf9fa4e51770f4796ea165dd03a769b8606681a38954a0a92c4cbffd6609ce9"),
    
    .init(_X: "8a6d8b925da15a273dec3d8f8395ec35cd6878f274b2b180e4e106999db64043", _Y:
            "96f67f870c157743da0b1eb84d89bf30500d74dc84c11f501ee1cb013acc8c46"),
    
    .init(_X: "39cecb62e863729f572f7dfc46c24867981bf04bb405fed0df39e33984bfade5", _Y:
            "61c2364434012e68a2be2e9952805037e52629d7762fafc8e10e9fb5bad8f790")
    ]

    var torusIndexes:[BigUInt] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var val:AllNodeDetailsModel
    init(proxyAddress:String){
        self.proxyAddress = proxyAddress
        val = .init(_currentEpoch: currentEpoch, _nodeListAddress: proxyAddress, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: true)
    }
    
}


struct SampleOutputPolygon{
    var currentEpoch:BigUInt = 1

    var proxyAddress:String
    var torusNodeEndpoints = [
        "https://node-1.torus-cluster-1.com/jrpc",
        "https://node-2.torus-cluster-1.com/jrpc",
        "https://node-3.torus-cluster-1.com/jrpc",
        "https://node-4.torus-cluster-1.com/jrpc",
        "https://node-5.torus-cluster-1.com/jrpc"
      ]

    var torusNodePub: [TorusNodePub] = [
    .init(_X: "805f81fd2fdc0d207b5a8b6643cd8f885bb761942f31fd6e138fcf8871d44cff", _Y:
            "10bd6ec1675147256fbc4094c05191975a175d49ae8716ee83409929e6a302e7"),
    
    .init(_X: "28394dafddfa20cb9ef5c9c26c31415c613565c3bbd9a82af8bfc88376e65353", _Y:
            "5507f59c00d585fbed0ca08773a24faea4724e2b68be3da1e7281d5968251f1b"),
    
    .init(_X: "4a190019eea47a45e6edb6a871a850b67fb72dcd9e255a07156c31dbf3a40035", _Y:
            "565aa310a9e736f03d0693df4723880cafe25edba46c9ee88ace6453044d5ae9"),
    
    .init(_X: "8a0f03b3ad07b1bd6068bb0aad3fe9feea5181643b04d292c65769c96b5990f8", _Y:
            "4b34b66a7d91ff85f330a3c012a7bf45f5509be57bdf61885a906214d818a695"),
    
    .init(_X: "dcf3b3c5a9e43533b875862b4dcfd5614535e7838d9a916f3f735e28e345cd9d", _Y:
            "856d980747c1d171972b2ea34831670763d4b493ea7537b295b4be4c25b012fc")
    ]

    var torusIndexes:[BigUInt] = [1, 2, 3, 4, 5]
    var val:AllNodeDetailsModel
    init(proxyAddress:String){
        self.proxyAddress = proxyAddress
        val = .init(_currentEpoch: currentEpoch, _nodeListAddress: proxyAddress, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: true)
    }
    
}


struct SampleOutputRopsten{
    var currentEpoch:BigUInt = 15

    var proxyAddress:String
    var torusNodeEndpoints = [
        "https://teal-15-1.torusnode.com/jrpc",
        "https://teal-15-3.torusnode.com/jrpc",
        "https://teal-15-4.torusnode.com/jrpc",
        "https://teal-15-5.torusnode.com/jrpc",
        "https://teal-15-2.torusnode.com/jrpc"
      ]

    var torusNodePub: [TorusNodePub] = [
    .init(_X: "1363aad8868cacd7f8946c590325cd463106fb3731f08811ab4302d2deae35c3", _Y:
            "d77eebe5cdf466b475ec892d5b4cffbe0c1670525debbd97eee6dae2f87a7cbe"),
    
    .init(_X: "7c8cc521c48690f016bea593f67f88ad24f447dd6c31bbab541e59e207bf029d", _Y:
            "b359f0a82608db2e06b953b36d0c9a473a00458117ca32a5b0f4563a7d539636"),
    
    .init(_X: "8a86543ca17df5687719e2549caa024cf17fe0361e119e741eaee668f8dd0a6f", _Y:
            "9cdb254ff915a76950d6d13d78ef054d5d0dc34e2908c00bb009a6e4da701891"),
    
    .init(_X: "25a98d9ae006aed1d77e81d58be8f67193d13d01a9888e2923841894f4b0bf9c", _Y:
            "f63d40df480dacf68922004ed36dbab9e2969181b047730a5ce0797fb6958249"),
    
    .init(_X: "d908f41f8e06324a8a7abcf702adb6a273ce3ae63d86a3d22723e1bbf1438c9a", _Y:
            "f977530b3ec0e525438c72d1e768380cbc5fb3b38a760ee925053b2e169428ce")
    ]

    var torusIndexes:[BigUInt] = [1, 2, 3, 4, 5]
    var val:AllNodeDetailsModel
    init(proxyAddress:String){
        self.proxyAddress = proxyAddress
        val = .init(_currentEpoch: currentEpoch, _nodeListAddress: proxyAddress, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: true)
    }
    
}
            






