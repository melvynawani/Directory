//
//  Staff.swift
//  Directory
//
//  Created by Melvyn Awani on 29/06/2022.
//

import Foundation

// MARK: - Staff
struct Staff: Codable {
    let createdAt: String
    let firstName: String
    let avatar: String
    let lastName: String
    let email: String
    let jobtitle: String
    let favouriteColor: String
    let id: String
    let data: DataClass?
    let to: String?
    let fromName: String?
}

// MARK: - DataClass
struct DataClass: Codable {
    let title, body, id, toID: String
    let fromID, meetingid: String

    enum CodingKeys: String, CodingKey {
        case title, body, id
        case toID = "toId"
        case fromID = "fromId"
        case meetingid
    }
}

typealias StaffList = [Staff]
