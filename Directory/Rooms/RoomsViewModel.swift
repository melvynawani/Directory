//
//  RoomsViewModel.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

protocol RoomsViewModelInput {
    func getRooms(urlString: String) async throws
}

protocol RoomsViewModelOutput {
    var roomsCount: Int { get }
    func getRoomDetails(index:Int)-> (String, String)
}

final class RoomsViewModel {
    
    private let networkManager: Networkable
    private var rooms: Rooms = []

    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
}

extension RoomsViewModel: RoomsViewModelInput {
    func getRooms(urlString: String) async throws {
        do {
            let data =  try await networkManager.get(urlString: urlString)
            let decoder = JSONDecoder()
            let decodedData =  try decoder.decode(Rooms.self, from: data)
            rooms = decodedData
        }
        catch {
            throw error
        }
    }
}

extension RoomsViewModel: RoomsViewModelOutput {
    var roomsCount: Int {
        get {
            return rooms.count
        }
    }
    
    func getRoomDetails(index: Int) -> (String, String) {
        let room = rooms[index]
        if room.isOccupied == true {
            return (room.id, Constants.occupiedRoomMessage)
        }
    
        return (room.id, Constants.unoccupiedRoomMessage)
        
    }
}
