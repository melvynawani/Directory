//
//  Constants.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

struct Constants {
    
    // Messages
    static let unoccupiedRoomMessage = NSLocalizedString("not_occupied", comment:"")
    static let occupiedRoomMessage = NSLocalizedString("occupied", comment:"")

    static let alertTitle = NSLocalizedString("alert", comment:"")
    
    // room field names
    struct FieldName {
        static let id = NSLocalizedString("id", comment:"")
        static let email = NSLocalizedString("email", comment:"")
        static let jobTitle = NSLocalizedString("job_title", comment:"")
        static let favouriteColor = NSLocalizedString("favourite_color", comment:"")
    }
    
    
    // Segues Constants
    static let contactsViewSegue = "moveToDetails"

    // Cell Identifiers
    struct Identifiers {
        static let roomCell = "roomCell"
        static let contactsViewCell = "cell"
        static let contactDetailsCell = "detailsCell"
    }
}
