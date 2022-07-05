//
//  ContactsViewModel.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

protocol ContactsViewModelInput {
    func getStaffs(urlString: String)async throws
}

protocol ContactsViewModelOutput{
    var numberOfStaffs: Int {get}
    var selectedStaff: Staff? { get set }
    func getStafRecord(for index:Int)-> StaffRecord
}

protocol ContactsViewModelActoin {
    func selectStaff(indexPath: Int)
}

final class ContactsViewModel {
    private let networkManager: Networkable
    private var staffs: StaffList = []
    var selectedStaff: Staff?
    
    init(networkManager: Networkable) {
        self.networkManager = networkManager
    }
}

extension ContactsViewModel: ContactsViewModelInput {
    func getStaffs(urlString: String) async throws
    {
        do {
            let data = try await networkManager.get(urlString: urlString)
            let decoder = JSONDecoder()
            let decodedData =  try decoder.decode(StaffList.self, from: data)
            staffs = decodedData
        }
        catch{
           throw error
        }
    }
}

extension ContactsViewModel: ContactsViewModelOutput {
    
    var numberOfStaffs: Int {
        return staffs.count
    }
    
    func getStafRecord(for index:Int)-> StaffRecord {
        let staff = staffs[index]
        
        return StaffRecord(fieldName: staff.firstName, fieldValue: staff.lastName)
    }
}

extension ContactsViewModel: ContactsViewModelActoin {
    func selectStaff(indexPath: Int){
        selectedStaff = staffs[indexPath]
    }
}
