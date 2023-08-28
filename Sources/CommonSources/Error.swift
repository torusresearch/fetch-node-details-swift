//
//  File.swift
//  
//
//  Created by CW Lee on 10/07/2023.
//

import Foundation

/// An error that occurs during the decoding of a value.
public enum FetchNodeError : Error {
    case InvalidNetwork(String)
    case InvalidMigrationNetwork(String)
    
}
