//
//  APIError.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

enum APIError: Error {
    case requestFailed
    case invalidData
    
    var localizedDescription: String {
        switch self {
        case .requestFailed:
            return NSLocalizedString("request_failed", comment:"")
        case .invalidData:
            return NSLocalizedString("invalid_data", comment:"")
        }
    }
}
