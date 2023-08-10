//
//  CountriesViewController.swift
//  DesafioJoinin
//
//  Created by Igor Fortti on 10/08/23.
//

import UIKit

class CountriesViewController: UIViewController {
    // MARK: - Properties
    var viewModel: CountriesViewModel
    var customView: CountriesView?
    
    // MARK: - Initializers
    init(viewModel: CountriesViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Override Methods
    override func loadView() {
        super.loadView()
        customView = CountriesView(tableViewDelegate: self, tableViewDataSource: self, searchBarDelegate: self)
        view = customView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.filterDelegate = self
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        viewModel.dismiss()
    }
}
// MARK: - Extension
extension CountriesViewController: CountriesFilterDelegate {
    func filteredListReceivedData() {
        customView?.listCountriesTableView.reloadData()
    }
}

extension CountriesViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.updateSearchText(text: searchText)
    }
}

extension CountriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filteredList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ListCountriesTableViewCell.identifier, for: indexPath) as? ListCountriesTableViewCell
        cell?.setupCell(data: viewModel.filteredList[indexPath.row])
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = viewModel.filteredList[indexPath.row]
        viewModel.didSelectedCountry(country: selectedCell)
    }
}
