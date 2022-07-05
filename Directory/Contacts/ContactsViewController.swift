//
//  ViewController.swift
//  Directory
//
//  Created by Melvyn Awani on 29/06/2022.
//

import UIKit

final class ContactsViewController: UIViewController, Alertable {
    
    @IBOutlet weak var tableView: UITableView!
    
    let viewModel = ContactsViewModel(networkManager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        getContacts()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let selectedStaff = viewModel.selectedStaff else {return}
        let destination = segue.destination as! ContactDetailsViewController
        destination.viewModel = ContactDetailsViewModel(staff: selectedStaff)
    }
    
    private func getContacts() {
        Task {
            do {
                try  await viewModel.getStaffs(urlString: Endpoints.getStaffUrl)
                refreshTableView()
            }catch {
                showAlert(title: NSLocalizedString(Constants.alertTitle, comment:""), message: error.localizedDescription)
            }
        }
    }
    private func refreshTableView() {
        tableView.reloadData()
    }
    
    
}

//MARK: - TABLEVIEW DATASOURCE
extension ContactsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfStaffs
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.contactsViewCell, for: indexPath) as! ContactsTableViewCell
        
        let stafRecord = viewModel.getStafRecord(for: indexPath.row)
        let name = "\(stafRecord.fieldName) \(stafRecord.fieldValue)"
        
        cell.name.text = name
        
        cell.isAccessibilityElement = true
        cell.accessibilityValue = name
        return cell
    }
}

//MARK: - TABLEVIEW DELEGATE
extension ContactsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel.selectStaff(indexPath: indexPath.row)
        performSegue(withIdentifier: Constants.contactsViewSegue, sender: nil)
    }
}

