//
//  Endpoints.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

struct Endpoints {
    static let baseUrl = "https://61e947967bc0550017bc61bf.mockapi.io/api/v1/"
    static let getStaffUrl = "\(Endpoints.baseUrl)\(Path.people)"
    static let getRoomsUrl = "\(Endpoints.baseUrl)\(Path.rooms)"
    
}

struct Path {
    static let people = "people"
    static let rooms = "rooms"
    
}
