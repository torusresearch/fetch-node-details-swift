//
//  File.swift
//
//
//  Created by Dhruv Jaiswal on 06/05/22.
//

import Foundation

class FNDJsonHelper {
    func getJsonFile(name: String) throws -> Any {
        var bundle = Bundle(identifier: "torus.cptest")
        var path = bundle?.path(forResource: "FND", ofType: "bundle")
        path?.append("/\(name).json")
        #if SWIFT_PACKAGE
            bundle = nil
            path = nil
            path = Bundle.module.url(forResource: name, withExtension: "json")?.path
        #endif
        if let path = path {
            let data = try Data(contentsOf: URL(fileURLWithPath: path))
            let jsonResult = try JSONSerialization.jsonObject(with: data)
            return jsonResult
        } else {
            throw FNDError.ABIFileMissing
        }
    }

    func jsonToString(json: Any) throws -> String {
        let data = try JSONSerialization.data(withJSONObject: json, options: JSONSerialization.WritingOptions.prettyPrinted)
        if let convertedString = String(data: data, encoding: String.Encoding.utf8) {
            return convertedString
        } else {
            throw FNDError.ABIJsonSerializationFailed
        }
    }

    func loadABIFile() -> String {
        do {
            let file = try getJsonFile(name: "abi")
            let str = try jsonToString(json: file)
            return str
        } catch {
            // backup incase abi file is missing
            return "{\"abi\":[{\"inputs\":[{\"internalType\":\"string\",\"name\":\"_verifier\",\"type\":\"string\"},{\"internalType\":\"bytes32\",\"name\":\"hashedVerifierId\",\"type\":\"bytes32\"}],\"name\":\"getNodeSet\",\"outputs\":[{\"internalType\":\"uint256\",\"name\":\"currentEpoch\",\"type\":\"uint256\"},{\"internalType\":\"string[]\",\"name\":\"torusNodeEndpoints\",\"type\":\"string[]\"},{\"internalType\":\"uint256[]\",\"name\":\"torusNodePubX\",\"type\":\"uint256[]\"},{\"internalType\":\"uint256[]\",\"name\":\"torusNodePubY\",\"type\":\"uint256[]\"},{\"internalType\":\"uint256[]\",\"name\":\"torusIndexes\",\"type\":\"uint256[]\"}],\"stateMutability\":\"view\",\"type\":\"function\"}]}"
        }
    }
}
