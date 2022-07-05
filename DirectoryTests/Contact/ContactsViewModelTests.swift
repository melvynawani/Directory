//
//  ContactsViewModelTests.swift
//  DirectoryTests
//
//  Created by Melvyn Awani on 30/06/2022.
//

import XCTest
@testable import Directory

class ContactsViewModelTests: XCTestCase {
    var contactsViewModel: ContactsViewModel!
    override func setUpWithError() throws {
        contactsViewModel = ContactsViewModel(networkManager: MockNetworkManager())
    }
    
    override func tearDownWithError() throws {
       contactsViewModel = nil
    }

    func testGetStaff_success() async throws {
        try? await contactsViewModel.getStaffs(urlString: "People")
        XCTAssertEqual(contactsViewModel.numberOfStaffs, 69)
        
        let staff = contactsViewModel.getStafRecord(for: 0)
        
        XCTAssertEqual(staff.fieldName, "Maggie")
    }
    
    func testGetStaff_fail() async throws {
        do {
            try await contactsViewModel.getStaffs(urlString: "fail")

        }catch {
            XCTAssertEqual(error as! APIError, APIError.invalidData)
        }
    }

    func testGetSelectedStaff() async throws {
        try? await contactsViewModel.getStaffs(urlString: "People")

        contactsViewModel.selectStaff(indexPath:0)

        XCTAssertEqual(contactsViewModel.selectedStaff?.firstName, "Maggie")
    }
    

}
