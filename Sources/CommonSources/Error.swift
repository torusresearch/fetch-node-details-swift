//
//  File.swift
//  
//
//  Created by CW Lee on 10/07/2023.
//

import Foundation

public enum FetchNodeError : Error {
    case InvalidURL
    case InvalidInput
    case GeneralError(String)
    case InvalidNetwork(String)
    case InvalidMigrationNetwork(String)
}
