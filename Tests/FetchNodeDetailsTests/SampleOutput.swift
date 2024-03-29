import BigInt
@testable import CommonSources
@testable import FetchNodeDetails
@testable import FndBase

import XCTest

public struct SampleOutputMainnet {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: try! getSSSEndpoints(network: .legacy(.MAINNET)), // SAPPHIRE_NETWORK_URLS[.SAPPHIRE_MAINNET]!,
            _torusNodeSSSEndpoints: try! getSSSEndpoints(network: .legacy(.MAINNET)),
            _torusNodeRSSEndpoints: try! getRSSEndpoints(network: .legacy(.MAINNET)),
            _torusNodeTSSEndpoints: try! getTSSEndpoints(network: .legacy(.MAINNET)),
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

public struct SampleOutputTestnet {
    var currentEpoch: String = "1"
    var nodeListAddress: String = "0xd084604e5FA387FbC2Da8bAab07fDD6aDED4614A"
    var updated = true
    var torusNodeEndpoints = try! getSSSEndpoints(network: .legacy(.TESTNET))
    var torusNodePub: [TorusNodePubModel] = [
        .init(_X: "f74389b0a4c8d10d2a687ae575f69b20f412d41ab7f1fe6b358aa14871327247", _Y: "54e3a73098ed9bced3ef8821736e9794f9264a1420c0c7ad15d2fa617ba35ef7"),
        .init(_X: "bc38813a6873e526087918507c78fc3a61624670ee851ecfb4f3bef55d027b5a", _Y: "ac4b21229f662a0aefdfdac21cf17c3261a392c74a8790db218b34e3e4c1d56a"),
        .init(_X: "b56541684ea5fa40c8337b7688d502f0e9e092098962ad344c34e94f06d293fb", _Y: "759a998cef79d389082f9a75061a29190eec0cac99b8c25ddcf6b58569dad55c"),
        .init(_X: "7bcb058d4c6ffc6ba4bfdfd93d141af35a66338a62c7c27cdad2ae3f8289b767", _Y: "336ab1935e41ed4719e162587f0ab55518db4207a1eb36cc72303f1b86689d2b"),
        .init(_X: "bf12a136ef94399ea098f926f04e26a4ec4ac70f69cce274e8893704c4951773", _Y: "bdd44828020f52ce510e026338216ada184a6867eb4e19fb4c2d495d4a7e15e4"),
    ]
    var torusIndexes: [BigUInt] = [1, 2, 3, 4, 5]

    var val: AllNodeDetailsModel {
        let sss = try! getSSSEndpoints(network: .legacy(.TESTNET))
        let rss = try! getRSSEndpoints(network: .legacy(.TESTNET))
        let tss = try! getTSSEndpoints(network: .legacy(.TESTNET))

        return .init(_currentEpoch: currentEpoch, _torusNodeEndpoints: torusNodeEndpoints, _torusNodeSSSEndpoints: sss, _torusNodeRSSEndpoints: rss, _torusNodeTSSEndpoints: tss, _torusIndexes: torusIndexes, _torusNodePub: torusNodePub, _updated: updated)
    }
}

public struct SampleOutputCyan {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: try! getSSSEndpoints(network: .legacy(.CYAN)),
            _torusNodeSSSEndpoints: try! getSSSEndpoints(network: .legacy(.CYAN)),
            _torusNodeRSSEndpoints: try! getRSSEndpoints(network: .legacy(.CYAN)),
            _torusNodeTSSEndpoints: try! getTSSEndpoints(network: .legacy(.CYAN)),
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

public struct SampleOutputAqua {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: try! getSSSEndpoints(network: .legacy(.AQUA)),
            _torusNodeSSSEndpoints: try! getSSSEndpoints(network: .legacy(.AQUA)),
            _torusNodeRSSEndpoints: try! getRSSEndpoints(network: .legacy(.AQUA)),
            _torusNodeTSSEndpoints: try! getTSSEndpoints(network: .legacy(.AQUA)),
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
            _torusNodeEndpoints: try! getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)), // SAPPHIRE_NETWORK_URLS[.SAPPHIRE_DEVNET]!,
            _torusNodeSSSEndpoints: try! getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)),
            _torusNodeRSSEndpoints: try! getRSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)),
            _torusNodeTSSEndpoints: try! getTSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)),
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

public struct SampleOutputSAPPHIREMAINNET {
    var val: AllNodeDetailsModel {
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: try! getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)), // SAPPHIRE_NETWORK_URLS[.SAPPHIRE_MAINNET]!,
            _torusNodeSSSEndpoints: try! getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)),
            _torusNodeRSSEndpoints: try! getRSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)),
            _torusNodeTSSEndpoints: try! getTSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)),
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
