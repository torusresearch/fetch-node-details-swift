import BigInt
@testable import FetchNodeDetails
import XCTest

public struct SampleOutputMainnet {
    var currentEpoch: String = "19"
    var nodeListAddress: String = "0xf20336e16B5182637f09821c27BDe29b0AFcfe80"
    var updated = true
    var torusNodeEndpoints = [
        "https://torus-19.torusnode.com/jrpc",
        "https://torus-node.ens.domains/jrpc",
        "https://torus-node.matic.network/jrpc",
        "https://torus.zilliqa.network/jrpc",
        "https://torus-mainnet.cosmos.network/jrpc",
        "https://torus2.etherscan.com/jrpc",
        "https://torus-node-v2.skalelabs.com/jrpc",
        "https://torus-node.binancex.dev/jrpc",
        "https://torusnode.ont.io/jrpc",
    ]
    var torusNodePub: [TorusNodePubModel] = [
        .init(_X: "bbe83c64177c3775550e6ba6ac2bc059f6847d644c9e4894e42c60d7974d8c2b", _Y:
            "82b49a7caf70def38cdad2740af45c1e4f969650105c5019a29bb18b21a9acb5"),

        .init(_X: "c208cac4ef9a47d386097a9c915b28e9cb89213abee8d26a17198ee261201b0d", _Y:
            "c7db2fe4631109f40833de9dc78d07e35706549ee48fa557b33e4e75e1047873"),

        .init(_X: "ca1766bb426d4ca5582818a0c5439d560ea64f5baa060793ab29dd3d0ceacfe", _Y:
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
            "61c2364434012e68a2be2e9952805037e52629d7762fafc8e10e9fb5bad8f790"),
    ]
    var torusIndexes: [BigUInt] = [1, 2, 3, 4, 5, 6, 7, 8, 9]
    var val: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }
}

public struct SampleOutputTestnet {
    var currentEpoch: String = "15"
    var nodeListAddress: String = "0xd084604e5FA387FbC2Da8bAab07fDD6aDED4614A"
    var updated = true
    var torusNodeEndpoints = [
        "https://teal-15-1.torusnode.com/jrpc",
        "https://teal-15-3.torusnode.com/jrpc",
        "https://teal-15-4.torusnode.com/jrpc",
        "https://teal-15-5.torusnode.com/jrpc",
        "https://teal-15-2.torusnode.com/jrpc",
    ]
    var torusNodePub: [TorusNodePubModel] = [
        .init(_X: "1363aad8868cacd7f8946c590325cd463106fb3731f08811ab4302d2deae35c3", _Y:
            "d77eebe5cdf466b475ec892d5b4cffbe0c1670525debbd97eee6dae2f87a7cbe"),

        .init(_X: "7c8cc521c48690f016bea593f67f88ad24f447dd6c31bbab541e59e207bf029d", _Y:
            "b359f0a82608db2e06b953b36d0c9a473a00458117ca32a5b0f4563a7d539636"),

        .init(_X: "8a86543ca17df5687719e2549caa024cf17fe0361e119e741eaee668f8dd0a6f", _Y:
            "9cdb254ff915a76950d6d13d78ef054d5d0dc34e2908c00bb009a6e4da701891"),

        .init(_X: "25a98d9ae006aed1d77e81d58be8f67193d13d01a9888e2923841894f4b0bf9c", _Y:
            "f63d40df480dacf68922004ed36dbab9e2969181b047730a5ce0797fb6958249"),

        .init(_X: "d908f41f8e06324a8a7abcf702adb6a273ce3ae63d86a3d22723e1bbf1438c9a", _Y:
            "f977530b3ec0e525438c72d1e768380cbc5fb3b38a760ee925053b2e169428ce"),
    ]
    var torusIndexes: [BigUInt] = [1, 2, 3, 4, 5]
    var val: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }
}

public struct SampleOutputCyan {
    var currentEpoch: String = "1"
    var nodeListAddress = "0x9f072ba19b3370e512aa1b4bfcdaf97283168005"
    var updated = true
    var torusNodeEndpoints = [
        "https://node-1.torus-cluster-1.com/jrpc",
        "https://node-2.torus-cluster-1.com/jrpc",
        "https://node-3.torus-cluster-1.com/jrpc",
        "https://node-4.torus-cluster-1.com/jrpc",
        "https://node-5.torus-cluster-1.com/jrpc",
    ]
    var torusNodePub: [TorusNodePubModel] = [
        .init(_X: "805f81fd2fdc0d207b5a8b6643cd8f885bb761942f31fd6e138fcf8871d44cff", _Y:
            "10bd6ec1675147256fbc4094c05191975a175d49ae8716ee83409929e6a302e7"),

        .init(_X: "28394dafddfa20cb9ef5c9c26c31415c613565c3bbd9a82af8bfc88376e65353", _Y:
            "5507f59c00d585fbed0ca08773a24faea4724e2b68be3da1e7281d5968251f1b"),

        .init(_X: "4a190019eea47a45e6edb6a871a850b67fb72dcd9e255a07156c31dbf3a40035", _Y:
            "565aa310a9e736f03d0693df4723880cafe25edba46c9ee88ace6453044d5ae9"),

        .init(_X: "8a0f03b3ad07b1bd6068bb0aad3fe9feea5181643b04d292c65769c96b5990f8", _Y:
            "4b34b66a7d91ff85f330a3c012a7bf45f5509be57bdf61885a906214d818a695"),

        .init(_X: "dcf3b3c5a9e43533b875862b4dcfd5614535e7838d9a916f3f735e28e345cd9d", _Y:
            "856d980747c1d171972b2ea34831670763d4b493ea7537b295b4be4c25b012fc"),
    ]
    var torusIndexes: [BigUInt] = [1, 2, 3, 4, 5]
    var val: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }
}

public struct SampleOutputAqua {
    var currentEpoch: String = "1"
    var nodeListAddress = "0x29Dea82a0509153b91040ee13cDBba0f03efb625"
    var updated = true
    var torusNodeEndpoints = [
        "https://node-1.cluster-2.aqua.web3auth.io/jrpc",
        "https://node-2.cluster-2.aqua.web3auth.io/jrpc",
        "https://node-3.cluster-2.aqua.web3auth.io/jrpc",
        "https://node-4.cluster-2.aqua.web3auth.io/jrpc",
        "https://node-5.cluster-2.aqua.web3auth.io/jrpc",
    ]
    var torusNodePub: [TorusNodePubModel] = [
        .init(_X: "7d376a4a7ce6bba7a8a49001aaa2de3f24e0f56ee73a77c6678ec00363616f25", _Y:
            "d5752873e522f98b4ded27690aadfda57ff5dc2fd0c3055b9d83663441667010"),

        .init(_X: "0e1b5debe1d9b42eb9917a5fe84fa5f48cae7a770b1f49f0546fbe26b1efaff3", _Y:
            "8947458cbfd8b40c7bc6160c7c746c2dca65c7d6ffdccd5579203b92a020b4ad"),

        .init(_X: "98c3582b138b375b643984094882c17ca7ee090787c0a7065d229672845aa25e", _Y:
            "02c3923bd015faac2cf3d91ab4cf8c6cdd4eb9f99e407a35703edf17e8c35d"),

        .init(_X: "e7ef4c1ea43bd385ab8bfb02a5aedcd33bed35b95980c0729e9a35edd02a8597", _Y:
            "d540aa7d1c9cafd2216e089b8c795a9034368960729103c9a2c875d76b81fc6d"),

        .init(_X: "bb7d3500ead64d0bccd97f24b5c848ff6cbe867c0c03ca9f2922626ac5d1e49d", _Y:
            "865ea03db0501bc9ffa83600202de437c7c10aa511c58ba54683b4d5f56ae314"),
    ]
    var torusIndexes: [BigUInt] = [1, 2, 3, 4, 5]
    var val: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }
}

public struct SampleOutputCeleste {
    var currentEpoch: String = "1"
    var nodeListAddress: String = "0x6Bffb4e89453069E7487f0fa5c9f4a2D771cce6c"
    var updated = true
    var torusNodeEndpoints = [
        "https://node-1.cluster-6.celeste.web3auth.io/jrpc",
        "https://node-2.cluster-6.celeste.web3auth.io/jrpc",
        "https://node-3.cluster-6.celeste.web3auth.io/jrpc",
        "https://node-4.cluster-6.celeste.web3auth.io/jrpc",
        "https://node-5.cluster-6.celeste.web3auth.io/jrpc",
    ]
    var torusNodePub: [TorusNodePubModel] = [
        .init(_X: "184a61fc08255c33ac8d57da86d957725e45157a4dfe6b80838b9c0acf450133", _Y:
            "06b2189341bc8ba97cd849f58bac8d6fa4484c42d57a529797a4d615bf20fbcd"),

        .init(_X: "3ca052df886a84096c2b2eded87cbfacab06d5e231b75a0fe8b6bc7fa4ed04a1", _Y:
            "1931cb683ff4c8216523f93b72f536dbbfae2c747ef40c48e0676641caf80d2b"),

        .init(_X: "498636b9bf53a0cfc337e23f506b1db5ebe55405666a412e23fc3ac5b289450b", _Y:
            "10dfdc3f72111c959b48b8caf2e42cfb907406b3efceb3d4d7b191a003094519"),

        .init(_X: "cd6541b449452f607705b0687b9aaaf3d3bd02bd615a5a80bfcb12201e12ade9", _Y:
            "3c1ef1d370c1dff494ae6360093e77df055b744dcf146d8b47ecb6dfd163d5af"),

        .init(_X: "7cb92d08513fca39e09b22d6d9ee5cc4e8ad782126067e0fb72c4717209fad3b", _Y:
            "b4c1fd6cb8beae828d6318cc7b085c2d80bdc51b46c086147d1537dab8ebae9b"),
    ]
    var torusIndexes: [BigUInt] = [1, 2, 3, 4, 5]
    var val: AllNodeDetailsModel {
        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }
}


public struct SampleOutputSAPPHIREDEVNET {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.SAPPHIRE_DEVNET]!,
            _torusNodeSSSEndpoints: getSSSEndpoints(network: .SAPPHIRE_DEVNET),
            _torusNodeRSSEndpoints: getRSSEndpoints(network: .SAPPHIRE_DEVNET),
            _torusNodeTSSEndpoints: getTSSEndpoints(network: .SAPPHIRE_DEVNET),
            _torusIndexes: [1, 2, 3, 4, 5],
            _torusNodePub: [
                .init(_X: "f74389b0a4c8d10d2a687ae575f69b20f412d41ab7f1fe6b358aa14871327247", _Y: "54e3a73098ed9bced3ef8821736e9794f9264a1420c0c7ad15d2fa617ba35ef7"),
                .init(_X: "bc38813a6873e526087918507c78fc3a61624670ee851ecfb4f3bef55d027b5a", _Y: "ac4b21229f662a0aefdfdac21cf17c3261a392c74a8790db218b34e3e4c1d56a"),
                .init(_X: "b56541684ea5fa40c8337b7688d502f0e9e092098962ad344c34e94f06d293fb", _Y: "759a998cef79d389082f9a75061a29190eec0cac99b8c25ddcf6b58569dad55c"),
                .init(_X: "7bcb058d4c6ffc6ba4bfdfd93d141af35a66338a62c7c27cdad2ae3f8289b767", _Y: "336ab1935e41ed4719e162587f0ab55518db4207a1eb36cc72303f1b86689d2b"),
                .init(_X: "bf12a136ef94399ea098f926f04e26a4ec4ac70f69cce274e8893704c4951773", _Y: "bdd44828020f52ce510e026338216ada184a6867eb4e19fb4c2d495d4a7e15e4"),
            ],
            _updated: true
        )
    }
}

public struct SampleOutputSAPPHIRETESTNET {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.SAPPHIRE_TESTNET]!,
            _torusNodeSSSEndpoints: getSSSEndpoints(network: .SAPPHIRE_TESTNET),
            _torusNodeRSSEndpoints: getRSSEndpoints(network: .SAPPHIRE_TESTNET),
            _torusNodeTSSEndpoints: getTSSEndpoints(network: .SAPPHIRE_TESTNET),
            _torusIndexes: [1, 2, 3, 4, 5],
            _torusNodePub: [
                .init(_X: "d0e57d0fb29f37888a71c5d1d8312b191121b53e7e77968ca59e5c2ceee89386", _Y: "2190e5e78c02ecdd4e5e04a01d3c12d847d53682ade7b6f715df1e1f3911081d"),
                .init(_X: "69d4fcd1ab4dedc06ac0bafaccac8e5459275ec12a8b3feaef26646ece902e38", _Y: "2319469c4344d78140ed9672c5231a0d045467dec66c77b53dfbefc56496ff3c"),
                .init(_X: "9b0ea52ef5d8fc68e02b3ea242b2b11556ab5746b92779a7c4d61ff57c054710", _Y: "0f9fc9e706e0a2d2b5c8511177583cdf5fa5379e2c3c1ed4db74aaded08b1a28"),
                .init(_X: "e08bb1de0c017241be3c8e2ab3e788b64cb83d77ddd5517424626d1e3a4a5406", _Y: "d4a87ae195e1f55fe4751caf22123d495cc4b51df48f234c956262fd1d8baafc"),
                .init(_X: "29154aaa5b76bdb5082ea9616769f1940e56de5c6d8afb8cc75fbd228302d961", _Y: "3535fb808e205f5589ca2dd28014103771266148ebc372f364dae0f3905dd811"),
            ],
            _updated: true
        )
    }
}

public struct SampleOutputSAPPHIREMAINNET {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.SAPPHIRE_MAINNET]!,
            _torusNodeSSSEndpoints: getSSSEndpoints(network: .SAPPHIRE_MAINNET),
            _torusNodeRSSEndpoints: getRSSEndpoints(network: .SAPPHIRE_MAINNET),
            _torusNodeTSSEndpoints: getTSSEndpoints(network: .SAPPHIRE_MAINNET),
            _torusIndexes: [1, 2, 3, 4, 5],
            _torusNodePub: [
                .init(_X: "e0925898fee0e9e941fdca7ee88deec99939ae9407e923535c4d4a3a3ff8b052", _Y: "54b9fea924e3f3e40791f9987f4234ae4222412d65b74068032fa5d8b63375c1"),
                .init(_X: "9124cf1e280aab32ba50dffd2de81cecabc13d82d2c1fe9de82f3b3523f9b637", _Y: "fca939a1ceb42ce745c55b21ef094f543b457630cb63a94ef4f1afeee2b1f107"),
                .init(_X: "555f681a63d469cc6c3a58a97e29ebd277425f0e6159708e7c7bf05f18f89476", _Y: "606f2bcc0884fa5b64366fc3e8362e4939841b56acd60d5f4553cf36b891ac4e"),
                .init(_X: "2b5f58d8e340f1ab922e89b3a69a68930edfe51364644a456335e179bc130128", _Y: "4b4daa05939426e3cbe7d08f0e773d2bf36f64c00d04620ee6df2a7af4d2247"),
                .init(_X: "3ecbb6a68afe72cf34ec6c0a12b5cb78a0d2e83ba402983b6adbc5f36219861a", _Y: "dc1031c5cc8f0472bd521a62a64ebca9e163902c247bf05937daf4ae835091e4"),
            ],
            _updated: true
        )
    }
}
