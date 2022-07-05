//
//  ContactDetailsViewController.swift
//  Directory
//
//  Created by Melvyn Awani on 29/06/2022.
//

import UIKit

final class ContactDetailsViewController: UIViewController {
    
    @IBOutlet private weak var staffImageView: UIImageView!
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var nameLbl: UILabel!
    
    var viewModel:ContactDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLbl.text = viewModel?.name
        tableView.dataSource = self
    }
}

//MARK: - TABLEVIEW DATASOURCE
extension ContactDetailsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.staffRecords.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.contactDetailsCell, for: indexPath) as! ContactDetailsTableViewCell
        
        nameLbl.text = viewModel?.name
        staffImageView.load(urlString: viewModel?.avtar)
        
        let name = viewModel?.staffRecords[indexPath.row].fieldName ?? ""
        let value = viewModel?.staffRecords[indexPath.row].fieldValue ?? ""
        cell.fieldNameLbl.text = name
        cell.fieldValueLbl.text = value
        
        // Acccessibility
        
        cell.isAccessibilityElement = true
        cell.accessibilityValue = "\(name) \(value)"
        
        staffImageView.accessibilityValue = "\(name)'s avtar"
        return cell
    }
    
}



