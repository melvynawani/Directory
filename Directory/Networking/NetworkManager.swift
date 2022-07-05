//
//  NetworkManager.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

protocol Networkable {
    func get (urlString: String) async throws -> Data
}

final class NetworkManager: Networkable {
    func get(urlString: String) async throws -> Data {
        guard let url = URL(string: urlString)  else {
            throw APIError.requestFailed
        }
        do {
            let (data, _)  = try await URLSession.shared.data(from: url)
            return data
        }catch {
            throw APIError.invalidData
        }
    }
    
}
