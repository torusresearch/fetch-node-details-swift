public var NODE_DETAILS_SAPPHIRE_TESTNET: AllNodeDetailsModel {
    return .init(
        _currentEpoch: "1",
        _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[TORUS_NETWORK["SAPPHIRE_TESTNET"]!]!,
        _torusNodeSSSEndpoints: getSSSEndpoints(network: TORUS_NETWORK["SAPPHIRE_TESTNET"]!),
        _torusNodeRSSEndpoints: getRSSEndpoints(network: TORUS_NETWORK["SAPPHIRE_TESTNET"]!),
        _torusNodeTSSEndpoints: getTSSEndpoints(network: TORUS_NETWORK["SAPPHIRE_TESTNET"]!),
        _torusIndexes: [1, 2, 3, 4, 5],
        _torusNodePub: [
            .init(_X: "d0e57d0fb29f37888a71c5d1d8312b191121b53e7e77968ca59e5c2ceee89386", _Y: "2190e5e78c02ecdd4e5e04a01d3c12d847d53682ade7b6f715df1e1f3911081d"),
            .init(_X: "69d4fcd1ab4dedc06ac0bafaccac8e5459275ec12a8b3feaef26646ece902e38", _Y: "2319469c4344d78140ed9672c5231a0d045467dec66c77b53dfbefc56496ff3c"),
            .init(_X: "9b0ea52ef5d8fc68e02b3ea242b2b11556ab5746b92779a7c4d61ff57c054710", _Y: "0f9fc9e706e0a2d2b5c8511177583cdf5fa5379e2c3c1ed4db74aaded08b1a28"),
            .init(_X: "e08bb1de0c017241be3c8e2ab3e788b64cb83d77ddd5517424626d1e3a4a5406", _Y: "d4a87ae195e1f55fe4751caf22123d495cc4b51df48f234c956262fd1d8baafc"),
            .init(_X: "29154aaa5b76bdb5082ea9616769f1940e56de5c6d8afb8cc75fbd228302d961", _Y: "3535fb808e205f5589ca2dd28014103771266148ebc372f364dae0f3905dd811"),
        ]
    )
}
