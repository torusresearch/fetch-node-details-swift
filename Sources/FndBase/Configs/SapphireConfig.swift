//
//  File.swift
//  
//
//  Created by CW Lee on 10/07/2023.
//

import Foundation
import CommonSources

public var SapphireMainnetNodePub : [TorusNodePubModel] = [
    .init(_X: "e0925898fee0e9e941fdca7ee88deec99939ae9407e923535c4d4a3a3ff8b052", _Y: "54b9fea924e3f3e40791f9987f4234ae4222412d65b74068032fa5d8b63375c1"),
    .init(_X: "9124cf1e280aab32ba50dffd2de81cecabc13d82d2c1fe9de82f3b3523f9b637", _Y: "fca939a1ceb42ce745c55b21ef094f543b457630cb63a94ef4f1afeee2b1f107"),
    .init(_X: "555f681a63d469cc6c3a58a97e29ebd277425f0e6159708e7c7bf05f18f89476", _Y: "606f2bcc0884fa5b64366fc3e8362e4939841b56acd60d5f4553cf36b891ac4e"),
    .init(_X: "2b5f58d8e340f1ab922e89b3a69a68930edfe51364644a456335e179bc130128", _Y: "4b4daa05939426e3cbe7d08f0e773d2bf36f64c00d04620ee6df2a7af4d2247"),
    .init(_X: "3ecbb6a68afe72cf34ec6c0a12b5cb78a0d2e83ba402983b6adbc5f36219861a", _Y: "dc1031c5cc8f0472bd521a62a64ebca9e163902c247bf05937daf4ae835091e4"),
]
public var SapphireTestnetNodePub : [TorusNodePubModel] =  [
    .init(_X: "d0e57d0fb29f37888a71c5d1d8312b191121b53e7e77968ca59e5c2ceee89386", _Y: "2190e5e78c02ecdd4e5e04a01d3c12d847d53682ade7b6f715df1e1f3911081d"),
    .init(_X: "69d4fcd1ab4dedc06ac0bafaccac8e5459275ec12a8b3feaef26646ece902e38", _Y: "2319469c4344d78140ed9672c5231a0d045467dec66c77b53dfbefc56496ff3c"),
    .init(_X: "9b0ea52ef5d8fc68e02b3ea242b2b11556ab5746b92779a7c4d61ff57c054710", _Y: "0f9fc9e706e0a2d2b5c8511177583cdf5fa5379e2c3c1ed4db74aaded08b1a28"),
    .init(_X: "e08bb1de0c017241be3c8e2ab3e788b64cb83d77ddd5517424626d1e3a4a5406", _Y: "d4a87ae195e1f55fe4751caf22123d495cc4b51df48f234c956262fd1d8baafc"),
    .init(_X: "29154aaa5b76bdb5082ea9616769f1940e56de5c6d8afb8cc75fbd228302d961", _Y: "3535fb808e205f5589ca2dd28014103771266148ebc372f364dae0f3905dd811"),
]
public var SapphireDevnetNodePub : [TorusNodePubModel] = [
    .init(_X: "f74389b0a4c8d10d2a687ae575f69b20f412d41ab7f1fe6b358aa14871327247", _Y: "54e3a73098ed9bced3ef8821736e9794f9264a1420c0c7ad15d2fa617ba35ef7"),
    .init(_X: "bc38813a6873e526087918507c78fc3a61624670ee851ecfb4f3bef55d027b5a", _Y: "ac4b21229f662a0aefdfdac21cf17c3261a392c74a8790db218b34e3e4c1d56a"),
    .init(_X: "b56541684ea5fa40c8337b7688d502f0e9e092098962ad344c34e94f06d293fb", _Y: "759a998cef79d389082f9a75061a29190eec0cac99b8c25ddcf6b58569dad55c"),
    .init(_X: "7bcb058d4c6ffc6ba4bfdfd93d141af35a66338a62c7c27cdad2ae3f8289b767", _Y: "336ab1935e41ed4719e162587f0ab55518db4207a1eb36cc72303f1b86689d2b"),
    .init(_X: "bf12a136ef94399ea098f926f04e26a4ec4ac70f69cce274e8893704c4951773", _Y: "bdd44828020f52ce510e026338216ada184a6867eb4e19fb4c2d495d4a7e15e4"),
]

public func SapphireConfig ( network : SapphireNetwork) throws -> AllNodeDetailsModel {
    switch network {
    case .SAPPHIRE_MAINNET :
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.SAPPHIRE_MAINNET]!,
            _torusNodeSSSEndpoints: try getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)),
            _torusNodeRSSEndpoints: try getRSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)),
            _torusNodeTSSEndpoints: try getTSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_MAINNET)),
            _torusIndexes: [1, 2, 3, 4, 5],
            _torusNodePub: SapphireMainnetNodePub
        )
    case .SAPPHIRE_TESTNET :
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.SAPPHIRE_TESTNET]!,
            _torusNodeSSSEndpoints: try getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_TESTNET)),
            _torusNodeRSSEndpoints: try getRSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_TESTNET)),
            _torusNodeTSSEndpoints: try getTSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_TESTNET)),
            _torusIndexes: [1, 2, 3, 4, 5],
            _torusNodePub: SapphireTestnetNodePub
        )
    case .SAPPHIRE_DEVNET :
        return .init(
            _currentEpoch: "1",
            _torusNodeEndpoints: SAPPHIRE_NETWORK_URLS[.SAPPHIRE_DEVNET]!,
            _torusNodeSSSEndpoints: try getSSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)),
            _torusNodeRSSEndpoints: try getRSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)),
            _torusNodeTSSEndpoints: try getTSSEndpoints(network: .sapphire(SapphireNetwork.SAPPHIRE_DEVNET)),
            _torusIndexes: [1, 2, 3, 4, 5],
            _torusNodePub: SapphireDevnetNodePub
        )
    }
}
