//
//  RoomsViewModelTests.swift
//  DirectoryTests
//
//  Created by Melvyn Awani on 30/06/2022.
//

import XCTest
@testable import Directory

class RoomsViewModelTests: XCTestCase {
    var roomsViewModel: RoomsViewModel!
    
    override func setUpWithError() throws {
        roomsViewModel = RoomsViewModel(networkManager: MockNetworkManager())
    }

    override func tearDownWithError() throws {
        roomsViewModel = nil
    }
    
    func testGetRooms_success() async throws {
        try? await roomsViewModel.getRooms(urlString: "Rooms")
        XCTAssertEqual(roomsViewModel.roomsCount, 65)
          
        let roomDetails1 = roomsViewModel.getRoomDetails(index: 0)
        XCTAssertEqual(roomDetails1.0, "1")
        
        XCTAssertEqual(roomDetails1.1, "is not occupied")
        
        let roomDetails2 = roomsViewModel.getRoomDetails(index: 7)

        XCTAssertEqual(roomDetails2.0, "8")
        
        XCTAssertEqual(roomDetails2.1, "is occupied")

    }
    
    func testGetStaff_fail() async throws {
        do {
            try await roomsViewModel.getRooms(urlString: "fail")

        }catch {
            XCTAssertEqual(error as! APIError, APIError.invalidData)
        }
    }
}
