//
//  ContactDetailsViewModel.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import Foundation

protocol ContactDetailsViewModelOutput {
    var name:String {get}
    var avtar:String {get}
    var staffRecords:[StaffRecord] { get }
}

final class ContactDetailsViewModel {
 
    private var staff: Staff
    var staffRecords:[StaffRecord] = []
    init(staff: Staff) {
        self.staff = staff
        self.staffRecords = getStaffRecords()
    }
    
    private func getStaffRecords()-> [StaffRecord] {
        let row1 = StaffRecord(fieldName: Constants.FieldName.id, fieldValue: "\(staff.id)")
        let row2 = StaffRecord(fieldName: Constants.FieldName.email, fieldValue: "\(staff.email)")
        let row3 = StaffRecord(fieldName: Constants.FieldName.jobTitle, fieldValue: "\(staff.jobtitle)")
        let row4 = StaffRecord(fieldName: Constants.FieldName.favouriteColor, fieldValue: "\(staff.favouriteColor)")
        
        return [row1, row2, row3, row4]
    }
}

extension ContactDetailsViewModel: ContactDetailsViewModelOutput {
    var name:String {
        return "\(staff.firstName) \(staff.lastName)"
    }
    var avtar:String {
       return staff.avatar
    }

}
