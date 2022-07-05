//
//  Room.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

// MARK: - Room
struct Room: Codable {
    let createdAt: String
    let isOccupied: Bool
    let maxOccupancy: Int
    let id: String
}

typealias Rooms = [Room]
