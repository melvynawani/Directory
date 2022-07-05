//
//  ContactDetailsViewModelTests.swift
//  DirectoryTests
//
//  Created by Melvyn Awani on 30/06/2022.
//

import XCTest
@testable import Directory

class ContactDetailsViewModelTests: XCTestCase {
    
    var contactDetailsViewModel: ContactDetailsViewModel!
    
    override func setUpWithError() throws {
        contactDetailsViewModel = ContactDetailsViewModel(staff: getFakeStaffs())
        
    }
    
    
    func testSelectedStaff() {
        
        XCTAssertEqual(contactDetailsViewModel.name, "test test")
        XCTAssertEqual(contactDetailsViewModel.avtar, "www.avtar.com/avtar.jpg")

        XCTAssertEqual(        contactDetailsViewModel.staffRecords.count
, 4)
    }
    func getFakeStaffs()-> Staff {
        return Staff(createdAt:"", firstName:"test", avatar:"www.avtar.com/avtar.jpg", lastName:"test", email:"test@mail.com", jobtitle:"title", favouriteColor:"green", id:"1", data: nil, to:"", fromName: nil)
    }
}
