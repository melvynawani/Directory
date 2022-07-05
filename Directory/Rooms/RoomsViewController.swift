//
//  RoomsViewController.swift
//  Directory
//
//  Created by Melvyn Awani on 30/06/2022.
//

import UIKit

final class RoomsViewController: UIViewController, Alertable {

    @IBOutlet private weak var tableView: UITableView!
    
    let viewModel = RoomsViewModel(networkManager: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        Task {
            do {
               try await viewModel.getRooms(urlString: Endpoints.getRoomsUrl)
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
extension RoomsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.Identifiers.roomCell, for: indexPath) as! RoomsTableViewCell
        
        let roomDetails = viewModel.getRoomDetails(index: indexPath.row)
        cell.textLabel?.text = "Room with id \(roomDetails.0) \(roomDetails.1)"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.roomsCount
    }
}
