//
//  MockNetworkManager.swift
//  DirectoryTests
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation
@testable import Directory

class MockNetworkManager: Networkable {
    
    func get(urlString: String) async throws -> Data {
        guard let url = Bundle(for: MockNetworkManager.self).url(forResource: urlString, withExtension: ".json"),
        let data = try? Data(contentsOf: url) else {
            throw APIError.invalidData
        }
        return data
    }
    
}
