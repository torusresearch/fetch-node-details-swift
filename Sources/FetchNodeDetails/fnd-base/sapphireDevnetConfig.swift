public var NODE_DETAILS_SAPPHIRE_DEVNET: AllNodeDetailsModel {
    return .init(
        _currentEpoch: "1",
        _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.sapphireDevnet]!,
        _torusNodeSSSEndpoints: getSSSEndpoints(network: .sapphireDevnet),
        _torusNodeRSSEndpoints: getRSSEndpoints(network: .sapphireDevnet),
        _torusNodeTSSEndpoints: getTSSEndpoints(network: .sapphireDevnet),
        _torusIndexes: [1, 2, 3, 4, 5],
        _torusNodePub: [
            .init(_X: "f74389b0a4c8d10d2a687ae575f69b20f412d41ab7f1fe6b358aa14871327247", _Y: "54e3a73098ed9bced3ef8821736e9794f9264a1420c0c7ad15d2fa617ba35ef7"),
            .init(_X: "bc38813a6873e526087918507c78fc3a61624670ee851ecfb4f3bef55d027b5a", _Y: "ac4b21229f662a0aefdfdac21cf17c3261a392c74a8790db218b34e3e4c1d56a"),
            .init(_X: "b56541684ea5fa40c8337b7688d502f0e9e092098962ad344c34e94f06d293fb", _Y: "759a998cef79d389082f9a75061a29190eec0cac99b8c25ddcf6b58569dad55c"),
            .init(_X: "7bcb058d4c6ffc6ba4bfdfd93d141af35a66338a62c7c27cdad2ae3f8289b767", _Y: "336ab1935e41ed4719e162587f0ab55518db4207a1eb36cc72303f1b86689d2b"),
            .init(_X: "bf12a136ef94399ea098f926f04e26a4ec4ac70f69cce274e8893704c4951773", _Y: "bdd44828020f52ce510e026338216ada184a6867eb4e19fb4c2d495d4a7e15e4"),
        ]
    )
}
